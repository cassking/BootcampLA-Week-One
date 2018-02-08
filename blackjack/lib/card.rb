class Card
  attr_reader :suit, :value
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def face_card?
    ['J', 'Q', 'K'].include?(@value)
  end
  def ace?
    ['A'].include?(@value)
  end

 def string
   return "Suit:#{@suit} Value: #{@value}"
 end

end
