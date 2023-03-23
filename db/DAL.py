from collections import namedtuple
from flask import current_app
import psycopg2
import env

def Row(columns):
	return namedtuple('Data', columns)

class DAL:
	def __init__(self):
		self.connection = self.connect_to_db()

	def connect_to_db(self):
		try:
			conn = psycopg2.connect(
				dbname=env.DB_NAME,
				user=env.DB_USER,
				password=env.DB_PASSWORD,
				host=env.DB_HOST,
				port=env.DB_PORT
			)
			return conn
		except psycopg2.Error as e:
			print(f"Error connecting to the database: {e}")
			return None

	def get_data(self, cursor, one_or_none=False):
		if not cursor.description: return None
		columns = [d[0] for d in cursor.description]
		Data = Row(columns)
		if one_or_none:
			return Data(*cursor.fetchone()) if cursor.rowcount else None
		else:
			return [Data(*row) for row in cursor.fetchall()]

	def execute(self, query, params=None):
		if self.connection is not None:
			try:
				cursor = self.connection.cursor()
				if params is not None:
					cursor.execute(query, params)
				else:
					cursor.execute(query)
				result = self.get_data(cursor)
				self.connection.commit()
				cursor.close()
				return result
			except psycopg2.Error as e:
				print(f"Error executing query: {e}")
				return None
		else:
			print("Database connection is not available.")
			return None
	
		def callproc(self, procname, args=(), one_or_none=False, read_only=False):
			def _exc(cursor):
				if read_only:
					cursor.execute("SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;")

				cursor.callproc(procname, args)
				data = self.get_data(cursor, one_or_none=one_or_none)
				if data and ((one_or_none and ERROR_MSG in data._fields) or (not one_or_none and ERROR_MSG in data[0]._fields)):
					raise DatabaseError(data.ErrorMsg if one_or_none else data[0].ErrorMsg, args)
				return data

			with self.connection() as (connection, cursor):
				try:
					return _exc(cursor)
				except DatabaseError:
					raise
				except Exception as e:
					proc_error = CallProcError(procname, args, one_or_none, e)
					connection.rollback()
					if proc_error.error_code in RETRY_CODES:
						time.sleep(.5)
						try:
							return _exc(cursor)
						except Exception as err:
							connection.rollback()
							proc_error.message += f"\nError on retrying procedure: {repr(err)}"
							proc_error.args = (proc_error.message, *proc_error.args[1:])

					raise proc_error
	def close(self):
		if self.connection is not None:
			self.connection.close()
