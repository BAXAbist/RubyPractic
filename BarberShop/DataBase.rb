require 'mysql2'
include Mysql2

class SQL
    @@instance=nil
    def self.get_instanse(data_name)
        if @@instance then
            @@instance.set_database(data_name)
        else
            @@instance = SQL.new(data_name)
        end
        return @@instance
    end

    def set_database(data_name)
        @database = Mysql2::Client.new(:username => 'root', :password => '111', :host => 'localhost', :database => 'barbershop')
    end
 
    private def initialize(data_name)
        self.set_database(data_name)
    end

    def db_select_clients()
        res = []
        @database.query("SELECT * FROM clients").each do |r| res <<  r; end
        return res
    end

    def db_select_RegClient(fullname)
        regclient = self.db_select_clients
        for i in regclient
            if (i["FullName"] == fullname)
                return i["RegCl"]
            end
        end
    end

    def db_insert_new_client(fullname,gender)
        @database.query("INSERT INTO clients(FullName,gender,RegCl) VALUES (\"#{fullname}\",\"#{gender}\",1)")
    end

    def db_select_hairs()
        res = []
        @database.query("SELECT * FROM hairs").each do |r| res <<  r; end
        return res
    end
    
    def db_select_shedule()
        res = []
        @database.query("SELECT * FROM shedule").each do |r| res <<  r; end
        return res
    end

    def db_add_visit(fullname,date,time)
        chel = []
        @database.query("SELECT id_client,gender FROM clients Where FullName = \'#{fullname}\'").each do |r| chel <<  r; end
        @database.query("INSERT INTO shedule(id_client,FullName,Date,Time,gender) 
            VALUES (\'#{chel[0]["id_client"]}\',\'#{fullname}\',\'#{date}\',\'#{time}\',\'#{chel[0]["gender"]}\')")
    end

    def db_confirm(id_hair,hairname, cost,id_client,date,time)
        @database.query("UPDATE shedule SET id_hair = \'#{id_hair}\', 
            Status = \'Подтверждено\', HairName = \'#{hairname}\', cost = \'#{cost}\'
            WHERE (id_client = \'#{id_client}\') AND (Date = \'#{date}\') AND (Time = \'#{time}\')")
        @database.query("UPDATE clients SET RegCl = RegCl + 1 WHERE id_client = \'#{id_client}\'")
    end

    def db_cancel(id_client,date,time)
        @database.query("UPDATE shedule SET Status = \'Отменено\'
            WHERE (id_client = \'#{id_client}\') AND (Date = \'#{date}\') AND (Time = \'#{time}\')")
    end

    def close()
        @database = nil
        @@instance = nil
    end
end