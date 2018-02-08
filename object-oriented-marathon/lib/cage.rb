class Cage
    attr_accessor :animal

    def empty?
        if animal == nil
            true #is empty
        else
            false #not empty
        end
    end
    #alternate
    #def empty?
    #@animal.nil?
    #end
end
