class Square
    require 'pry'
    attr_accessor :side, :x, :y, :length, :width, :diameter, :perimeter, :area
    def initialize(side, x=0, y=0)
        @side = side
        @x = x
        @y = y
        @length = @side
        @width = @side
        @diameter = Math.sqrt((@side.to_f ** 2) + (@side.to_f ** 2))
        @perimeter = @side*4
        @area = @side*side
    end

    def contains_point?(a,b)

        diff = side / 2.0 # diff = side (1)/2 =.5
        #check left
        if a < x - diff #if .5 < .5
          false
        #check right
        elsif a > x + diff #if .5 > .5
            false
            #check top
        elsif b > y + diff #if .5 > .5
            false
            #check bottom
        elsif b < y - diff #if .5 > .5
            false
        else
          true #is in square
        end
    end

end
