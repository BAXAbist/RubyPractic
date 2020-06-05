current_path = File.dirname(__FILE__)
require "#{current_path}/Database.rb"
# Модели добавить. Пояснение это методы работы с таблицами чтобы не обращаться 
#      к базе лишний раз
# Модель список текущих заказов сделать ее наблюдаемой. Добавить таймер который
#   сверяет время с текущим. Когда добавится сигнал в notify добавить update_history observer
class Controller
    #@historytable

    def initialize
       @database = SQL.new("BarberShop")
       @clientstable = @database.db_select_clients
       @hairstable = @database.db_select_hairs
    end

    def isRegClient(fullname)
        return @database.db_select_RegClient(fullname)
    end 
    
    def uploadToWorkHist

    end

    def appNewClient(fullname,gender)
        @database.db_insert_new_client(fullname,gender)
        @clientstable = @database.db_select_clients         #Хэ хэй новая фича 
    end

    def addVisit(fullname,date,time)
        @database.db_add_visit(fullname,date,time)
    end

    def showShedule
        return @database.db_select_shedule
    end

    def getHairs
        return @hairstable
    end

    def getClients
        return @clientstable
    end

    def confirmRec(id_hair,hairname, cost,id_client,date,time)
        @database.db_confirm(id_hair,hairname, cost,id_client,date,time)
    end
    
    def cancelRec(id_client,date,time)
        @database.db_cancel(id_client,date,time)
    end
end
