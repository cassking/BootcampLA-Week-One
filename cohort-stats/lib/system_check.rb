
require_relative "lesson"
require 'pry'
class SystemCheck < Lesson
  include Grade
    attr_reader :average, :submission
    attr_accessor :submissions, :average_grade, :grade
    def initialize(name, due)
        @name = name
        @due = due
        @submissions =[]
        @submission = submission

    end
    require 'pry'
    def submissions
        @submissions
    end
    def add_submission(submission)
        @submissions << submission
        @submission
    end
    def submittable?
         true
    end
    def average_grade
        sum = 0.0
        @submissions.each do |submission|
          if submission.graded?
            sum += submission.grade
          end
        end
        average = (sum / @submissions.count)
        average
      end
    # def average_grade
    #     @average = 0
    #     total_of_grades = 0
    #     @sumbissions.each do |a_submission|
    #         @submission = a_submission
    #
    #         total_of_grades+=a_submission.grade.to_i
    #     end
    #
    #     @average += total_of_grades/@submissions.counts
    # end
    def did_student_complete_system_check?(student_name)
      @submissions.each do |submission|
        if submission.student == student_name
          return true
        end
      end
     false
    end
    # def did_student_complete_system_check
    #     @sumbissions.each do |submission|
    #
    #         if (submission.nil?)
    #             false
    #         else
    #             true
    #         end
    #     end
    # end
      # binding.pry
end
