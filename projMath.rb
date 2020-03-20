class List_of_themes
    @list_themes
    @list_counts
    attr_accessor :count

    def initialize(a)
        self.count = a
    end

    def show_themes
        @list_themes.each do |i|
            puts (i.index+1) + ". " + i + ": " + @list_counts[i.index] 
        end
        
    
    end

    def to_a
        "count = #{@count}"
    end
end

count = gets.to_i
a = List_of_themes.new(count)
#puts a.methods
puts a.to_a
puts List_of_themes.superclass.superclass.superclass