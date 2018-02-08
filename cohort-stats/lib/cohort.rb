class Cohort
    attr_reader :title, :start_date, :end_date
    attr_accessor :system_checks, :students
require 'pry'
    def initialize(title, start_date, end_date)
        @title = title
        @start_date = start_date
        @end_date = end_date
        @students =[]
        @system_checks =[]
        @career_kickoff
    end
    # def students
    #     @students
    # end
    # def system_checks
    #     @system_checks
    # end
    def career_kickoff
        @end_date + 4
    end
    def enroll(student)
        if !@students.include?(student)
            @students << student
        end
    end
    def roster
        result =""
        result+="#{@title}"
        @students.each do | student |
            result+="#{student.name} #{student.email}"
        end
        return result
    end
    def assign(system_check)
        @system_checks << system_check
    end

    def system_check_completed?(system_check)
    @students.count == system_check.count
  end

end
