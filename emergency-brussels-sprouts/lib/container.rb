class Container
    require 'pry'
    attr_reader :weight, :maximum_holding_weight, :ingredients, :quantity_ingredient
    def initialize(weight, maximum_holding_weight)
        @weight = weight
        @maximum_holding_weight = maximum_holding_weight
        @ingredients =[]

    end
    def fill_with_ingredient(ingredient)
        @my_ingredient = nil
        @quantity_ingredient = maximum_holding_weight/ingredient.weight #7000
        quantity_ingredient.to_i.times do
            @ingredients << ingredient
            @my_ingredient = ingredient
        end
        @weight = @maximum_holding_weight + @weight
        @my_ingredient
    end
    def which_ingredient
        @my_ingredient.name
    end
    def how_many_ingredients
        @ingredients.length
    end
    def remove_one_ingredient
        @ingredients.pop
    end
    def empty
        @ingredients.clear
    end



end
