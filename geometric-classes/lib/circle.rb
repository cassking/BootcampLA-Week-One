class Circle
    attr_accessor :radius, :x, :y, :diameter, :area, :perimeter, :pi
    def initialize(radius, x=0, y=0)
        @radius = radius
        @pi = 3.14159
        @x = x
        @y = y
        @diameter = @radius*2
        @area =  @pi * radius*radius
        @perimeter = 2* pi * radius
    end
end
