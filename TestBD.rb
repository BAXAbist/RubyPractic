require 'mysql2'

def db_mysql_con
  @client = Mysql2::Client.new(:username => 'root', :password => '111', :host => '127.0.0.1', :database => 'BarberShop')
end

def db_select_log(conn)
  res=[]
  conn.query("SELECT * FROM clients WHERE gender = 'Ж' ").each do |r| res <<  r; end
  return res
end

def db_insert_log(conn,id,text)
  conn.query("INSERT INTO maintest(ID,CONTENT) VALUES (\"#{id}\",\"#{text}\")")
end

conn_mysql = db_mysql_con # Connect
puts db_select_log(conn_mysql) #Take result as array 
# id = "3"
# text = "ГЕНИЙ ВЕЛИКИЙ"
# db_insert_log(conn_mysql,id,text)
# id = '4'
# text = 'Test4'
# db_insert_log(conn_mysql, id, text)


conn_mysql.close

