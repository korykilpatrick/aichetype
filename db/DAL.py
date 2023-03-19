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

    def close(self):
        if self.connection is not None:
            self.connection.close()
