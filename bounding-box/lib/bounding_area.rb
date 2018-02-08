class BoundingArea
    def initialize(array_of_boxes)
        @array_of_boxes = array_of_boxes
    end
    def boxes_contain_point?(x, y)
        @array_of_boxes.each do | each_box |
            if each_box.contains_point?(x,y)
                return true
            end
        end
        return false
    end
end
