from termcolor import cprint

def insert_records(dal, tablename, records, ret=True, ignore=True, many=True, print_res=True, color='green'):
	if not records:
		cprint(f"No {tablename} records passed to insert_records", 'yellow')
		return

	insert_val = ', '.join(records[0]._fields)
	values_formatter = ', '.join(["%s" for _ in range(len(records[0]._fields))])
	sql = f"INSERT INTO {tablename} ({insert_val}) VALUES ({values_formatter}){'ON CONFLICT DO NOTHING' if ignore else ''}"

	dal.execute(sql, records, many=many)
	if print_res:
		cprint(f"Inserted {len(records)} records into {tablename}.", color)

	if ret:
		return dal.execute(f'select * from {tablename} order by id desc limit {len(records)}')