current_path = File.dirname(__FILE__)
require "#{current_path}/Controller.rb"
require 'gtk3'

if (Gem.win_platform?)
    Encoding.default_external = Encoding.find(Encoding.locale_charmap)
    Encoding.default_internal = __ENCODING__
  
    [STDIN, STDOUT].each do |io|
      io.set_encoding(Encoding.default_external, Encoding.default_internal)
    end
end

contr = Controller.new()
 while true
    puts ("Посмотреть записи: 1")
    puts ("Добавить Клиента: 2")
    puts ("Добавить запись: 3")
    puts ("Выход: 0")
    check = gets.chomp().to_i
    case check
    when 0
        puts("Bye")
        break
    when 1
        num = 1
        getS = contr.showShedule
        for i in getS
            normvremya = i["Time"].to_s.split[1]
            puts "#{num} #{i["FullName"]} #{i["Date"]} #{normvremya} #{i["Status"]} #{i["HairName"]} #{i["cost"]}"
            num = num + 1
        end
        puts("0 Назад")
        puts("Выберите Запись:")
        client = gets.chomp().to_i - 1
        if(getS[client]["Status"]=="Забронировано")
            puts("Подтвердить: 1")
            puts("Отменить: 2")
            puts("Назад: 0")
            check2 = gets.chomp.to_i
            case check2
            when 1
                discount = 1
                if(contr.isRegClient(getS[client]["FullName"])>=5)
                    discount = 0.97
                end
                num = 1
                getH = contr.getHairs
                goddamnHair = []
                j = 0
                for i in getH
                    if (i["gender"]==getS[client]["gender"])
                        puts "#{num} #{i["HairName"]} #{i["cost"]*discount}"
                        num = num + 1
                        goddamnHair << j
                    end
                    j+=1
                end
                    puts ("Выберите прическу: ")
                    hair = goddamnHair[gets.chomp().to_i-1]
                    normvremya = getS[client]["Time"].to_s.split[1]
                    contr.confirmRec(getH[hair]["id_hair"],getH[hair]["HairName"],
                        getH[hair]["cost"]*discount,getS[client]["id_client"],
                        getS[client]["Date"],normvremya)
            when 2
                normvremya = getS[client]["Time"].to_s.split[1]
                contr.cancelRec(getS[client]["id_client"], getS[client]["Date"], normvremya)
            when 0
                puts "Назад"
            end
        end 

    when 2
        puts ("Введите ФИО нового клиента:")
        fio = gets.chomp() 
        puts ("Введите пол клиента: М или Ж")
        sex = gets.chomp()
        if (sex=='М'||sex =='Ж')
            puts contr.appNewClient(fio,sex)
        end
    when 3
        getC = contr.getClients
        num = 1
        for i in getC
            puts "#{num} #{i["FullName"]}"
            num = num + 1
        end
        puts("Выберите клиента:")
        client = gets.chomp().to_i - 1
        puts ("Введите дату записи:")
        date = gets.chomp()
        puts ("Введите время записи:")
        time = gets.chomp()
        contr.addVisit(getC[client]["FullName"],date,time)
    end
 end
#puts ("Введите ФИО клиента:")
#fio = gets.chomp()
#puts ("Введите дату записи:")
#date = gets.chomp()
#puts ("Введите время записи:")
#time = gets.chomp()
#puts ("Введите пол клиента:")
#sex = gets.chomp()
#if (sex=='М'||sex =='Ж')
#   puts contr.appNewClient(fio,sex)
#end

#puts contr.showShedule

# contr.addVisit(fio,date,time)

# class GUI
#     def initialize
#         @builder = Gtk::Builder::new()
#         @builder.add_from_file("GUI/FormAuth.glade")
#         @builder.get_object("FormAuth").show()
#         @builder.connect_signals() do |handler|
#             begin
#                 method (handler)
#             rescue 
#                 method (default)    
#             end
#         end
#         Gtk.main
#     end

#     def on_FormAuth_destroy
#         Gtk.main_quit()
#     end

#     def default
#         puts "lol"
#     end

#     def but_add_client_click
#         @builder1 = Gtk::Builder::new()
#         @builder1.add_from_file("GUI/FormAuth.glade")
#         @builder1.get_object("Form_AddClient").show()
#     end

#     def but_AddRec_click
#         @formRec = Gtk::Builder::new()
#         @formRec.add_from_file("GUI/FormAuth.glade")
#         @formRec.get_object("Form_AddRec").show()
#     end

#     def but_addRec
#         fullName = formRec.get_object("")
#     end

#     kekw = GUI.new()

# end
