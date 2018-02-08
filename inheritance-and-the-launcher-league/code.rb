class SuperHero
  attr_reader :public_identity, :secret_identity
require 'pry'

  def initialize(public_identity, secret_identity)
    @public_identity = public_identity
    @secret_identity = secret_identity
  end

  def species
    "Human"
  end

  def home
    "Earth"
  end

  def fans_per_thousand
    500
  end

  def powers
    ""
  end

  def weakness
    ""
  end

  def backstory
    ""
  end

  def speed_in_mph
    60
  end

  def health
    100
  end

  def psychic?
    false
  end

end

class Speedster < SuperHero
    def species
     super
    end

    def home
      super
    end

    def fans_per_thousand
      super
    end

    def powers
      "oy powers"
    end

    def weakness
      "oy weakness"
    end

    def backstory
      "oy backstory"
    end

    def speed_in_mph
      super*1000
    end

    def health
      super
    end

    def psychic?
      super
    end

end

class Brawler < SuperHero
    def species
      super
    end

    def home
      super
    end

    def fans_per_thousand
      super
    end

    def powers
      "i can sing backwards"
    end

    def weakness
      "chocolate"
    end

    def backstory
      "i love cheese"
    end

    def speed_in_mph
      super
    end

    def health
      super*20
    end

    def psychic?
      super
    end

end

class Detective < SuperHero

    def species
      super
    end

    def home
      super
    end

    def fans_per_thousand
      super
    end

    def powers
     "can toast bread"
    end

    def weakness
      @secret_identity
    end

    def backstory
      "loves ABBA"
    end

    def speed_in_mph
      super/6
    end

    def health
      super
    end

    def psychic?
      false
    end


end

class Demigod < SuperHero
    def species
      super
    end

    def home
      "Cosmic Plane"
    end

    def fans_per_thousand
      super
    end

    def powers
      "great at picnincs"
    end

    def weakness
      "cartoons"
    end

    def backstory
      "i have  a story backwards"
    end

    def speed_in_mph
      super
    end

    def health
      super
    end

    def psychic?
      super
    end

end

class JackOfAllTrades < SuperHero
    def species
      "Alien"
    end

    def home
      "Venus"
    end

    def fans_per_thousand
        super
    end

    def powers
      "i smoke with my feet"
    end

    def weakness
      "i love television"
    end

    def backstory
      "i am a good cook"
    end

    def speed_in_mph
      super
    end

    def health
      super
    end

    def psychic?
      !super
    end

end

class WaterBased < SuperHero
    def species
      super
    end

    def home
      "Earth's Oceans"
    end

    def fans_per_thousand
      super/100
    end

    def powers
      "swimming"
    end

    def weakness
      "i like air"
    end

    def backstory
      "i used to be dry"
    end

    def speed_in_mph
      super
    end

    def health
      super
    end

    def psychic?
      !super
    end

end


class Nightbird < Detective
    def species
      super
    end

    def home
      super
    end

    def fans_per_thousand
      super
    end

    def powers
      "love to sleep"
    end

    def weakness
      "very sleepy"
    end

    def backstory
      "so sleepy"
    end

    def speed_in_mph
      super
    end

    def health
      super
    end

    def psychic?
      super
    end

end
