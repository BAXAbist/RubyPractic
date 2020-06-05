require 'mysql2'
class Strategy_super
  @client
  @data_table
  def initialize(dt)
    @client = Mysql2::Client.new(:username => 'root', :password => 'password', :host => '127.0.0.1', :database => 'testdb')
    @data_table = dt
  end
  def del_record(id_record)
    @client.query("DELETE FROM #{@data_table} WHERE order_id = #{id_record.to_i}")
  end
end

class Strategy_1 < Strategy_super
  def new_record (mass_data)
    @client.query("INSERT INTO #{@data_table}(order_name,order_loads,order_driver,order_way) VALUES (\"#{mass_data[0]}\",\"#{mass_data[1].to_i}\", \"#{mass_data[2]}\", \"#{mass_data[3]}\")")
  end
  def get_record()
    res=[]
    @client.query("SELECT * FROM #{@data_table}").each do |r| res <<  r; end
    return res
  end
  def change_record(num,mass)
    if mass[0] != ""
      @client.query("UPDATE #{@data_table} SET order_name = '#{mass[0]}' WHERE order_id = #{num.to_i}")
    end
      
    if mass[1] != ""
      @client.query("UPDATE #{@data_table} SET order_loads = '#{mass[1].to_i}' WHERE order_id = #{num.to_i}")
    end  

    if mass[2] != ""
      @client.query("UPDATE #{@data_table} SET order_driver = '#{mass[2]}' WHERE order_id = #{num.to_i}")
    end  

    if mass[3] != ""
      @client.query("UPDATE #{@data_table} SET order_way = '#{mass[3]}' WHERE order_id = #{num.to_i}")
    end  
  end  
end