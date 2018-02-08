class SystemCheckSubmission
   include Grade
    attr_reader :solution, :student
    attr_accessor :grade
    def initialize(solution,student)
        @solution = solution
        @student = student
        @grade = grade

    end
    def assign_grade(grade)
        if (grade >= 0)
            @grade = grade
        else
            return  "Invalid Grade Error!"
        end
    end
    def graded?
        if (@grade.nil?)
            false
        else
            true
        end
    end


end
