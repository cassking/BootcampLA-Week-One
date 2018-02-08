class Employee
    attr_reader :name, :title
    def initialize(name, title="Zoo Keeper")
        @name = name
        @title = title
        #alternate
        #@name,@title =@name,@title
    end
    def full_title
        "#{name}, #{title}"
    end
    #alternate
    # def full_title
    #     [@name,@title].join(", ")
    # end

    def greet
        "#{name} waved hello!"
    end
    
end
