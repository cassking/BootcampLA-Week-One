require 'pry'
class Circle
    attr_reader :radius
    def initialize(data)
        if data.kind_of?(Hash)
            puts 'this is a hash'
            if data[:radius].nil?
                @radius = data[:diameter]/2
            else
                @radius = data[:radius]
            end
        else
            @radius = data
        end
        # if data[:radius].nil?
        #     @radius = data[:diameter]/2
        # else
        #     @radius = data[:radius]
        # end
    end

end
circle = Circle.new(4)
circle2 = Circle.new({diameter: 4})

puts circle.inspect
puts circle2.inspect
# binding.pry
