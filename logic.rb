require 'java'
require 'jdbc/sqlite3'

module JavaSql
  include_package 'java.sql'
end

Jdbc::SQLite3.load_driver
Java::org.sqlite.JDBC

conn_str = 'jdbc:sqlite:./data.sqlite3'
conn = JavaSql::DriverManager.getConnection(conn_str)
stm = conn.createStatement
rs = stm.executeQuery("select * from items;")
while (rs.next) do
  puts rs.getString("name")
end
rs.close
stm.close
conn.close