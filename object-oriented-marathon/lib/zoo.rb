class Zoo
     require 'pry'
     # require_relative 'zoo_at_capacity, if file existed'
     # require_relative 'cage' <--- WHY?
    attr_reader :name #dan adds these :season_opening_date, :season_closing_date
    attr_accessor :cages, :employees

    def initialize(name, season_opening_date, season_closing_date)
        @name = name
        @season_opening_date = season_opening_date
        @season_closing_date = season_closing_date
        @cages =[]
        create_cages
        @employees =[]
        #dans way
        #create empty cages up on initialization
        #@cages = [].tap do |cages|
        #     10.times do
        #             cages << Cage.new
        #         end
        #end
    end
    def create_cages
        i=0
        while ( i < 10 ) do
            i += 1
            @cages << Cage.new
        end
    end
    #altnernate
    # def create_cages <<-- TAP OPERATION RETURNS RESULT OF BLOCK
    #     [].tap do | cages | FOR EMPTY ARRAY, PASS IT AS CAGES ARG, APPEND NIL INSTANCES 10 TIMES
    #         10.times do
    #             cages << Cage.new
    #         end
    #     end
    # end

    def add_animal(an_animal)#keep track of
        #state of cages empty or not?
        #@cages[0].animal = an_animal assign an
        #animal to first cage in list
        #find empty cage
        #if checking and empty.cage? is nil? true means all cages are full
        #empty_cage = @cages.find {|cage| cage.empty?}
        #
        #if !empty_cage.nil? <-- only add animal if open cage
        #empty_cage.animal = an_animal
        #else
        #raise ZooAtCapacity
        # end
        @cages.each do |cage|
            if cage.empty?
                cage.animal = an_animal
                return #add animal and return otherwise add 10 to one cage
            end
        end
        #has to be AFTER each loop
        return "Your zoo is already at capacity!"#explicitly return this
    end

    def add_employee(name)
          @employees << name
    end
    def open?(date)
        if (date >= @season_opening_date) && (date <= @season_closing_date)
             true
        else
             false
        end

        #altrnate
        #simply
        # date >= @season_opening_date && date <= @season_closing_date


    end
    def visit
        greeting = ""
        #results =""
        @employees.each do |employee|
            #DAN SOLUTION
            #results << employee.greet + "\n"
            greeting += "#{employee.greet}\n\n"
        end
        @cages.each do | cage |
            if !cage.empty?
                #results << cage.animal.speak + "\n" if cage.empty?
                greeting+="#{cage.animal.speak}\n"
            end
        end
        #results  NEED TO RETURN RESULTS
        return greeting # need to explicitly return this otherwise erro
    end

end
