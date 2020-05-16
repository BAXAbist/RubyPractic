require 'gtk3'

class GUI
    def initialize
        @builder = Gtk::Builder::new()
        @builder.add_from_file("GUI/FormAuth.glade")
        @builder.get_object("FormAuth").show()
        @builder.connect_signals() do |handler|
            begin
                method (handler)
            rescue 
                method (default)    
            end
        end
        Gtk.main
    end

    def on_FormAuth_destroy
        Gtk.main_quit()
    end

    def default
        puts "lol"
    end
end

kekw = GUI.new()