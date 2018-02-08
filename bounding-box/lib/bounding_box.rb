class BoundingBox
    #attr_accessor :boundingbox

    def initialize(x, y, width, height)
        @x = x
        @y = y
        @width = width
        @height = height
        @left = x
        @right = x+width
        @bottom = y
        @top = y+height
    end

    def width
        @width
    end

    def height
        @height
    end

    def left #left edge of box
        @left
    end

    def right #right edge of box
        @right
    end

    def top #top edge of box
        @top
    end

    def bottom #bottom edge of box
        @bottom
    end

    def contains_point?(x, y)
        # contains = false
        if x >= left && x <= right && y >= bottom && y <= top
            return true
        else
            return false
        end
        #returns true if the given (x, y) coordinate is within the box.
    end
end
