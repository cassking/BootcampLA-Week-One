class Ingredient
    attr_reader :name, :weight
    def initialize(name, weight)
        @name = name
        @weight = weight
    end


    def self.create_from_grams(name,weight)
        weight = weight/1000
        Ingredient.new(name,weight)
    end
end
