require 'pry'
# class Person
#     def initialize(first_name, last_name)
#         @first_name = first_name
#         @last_name = last_name
#     end
# end

# class Person
#     def initialize(name, last_name = nil)
#         if last_name.nil?
#             binding.pry
#             full_name = name.split('')
#             @first_name = first_name[0]
#             @last_name = last_name[1]
#         else
#             @first_name = first_name
#             @last_name = last_name
#         end
#     end
# end

class Person
    def initialize(name, last_name = nil, middle_name = nil)
        binding.pry
        if last_name.nil? # 1 argument
            full_name = name.split
            @first_name = full_name[0]
        if full_name.length == 2
            @last_name = full_name[1]
        else#if length is 3
            @middle_name = full_name[1]
            @last_name = full_name[2]
      end
        elsif last_name.nil? # if 2 arguments provided
            @first_name = name
            @middle_name = middle_name
        else #all 3 arguments provided
            @first_name = name
            @last_name = last_name
            @middle_name = @middle_name
        end
    end
end
binding.pry
