import duckdb

con = duckdb.connect("ventas_olap.duckdb")

print(con.sql("SHOW TABLES"))

con.close()