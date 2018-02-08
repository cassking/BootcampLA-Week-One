require_relative 'deck'
require 'pry'
class Hand
    attr_accessor :cards, :total_value
  def initialize(cards)
    @cards = cards
    @total_value = 0
  end

  def calculate_hand
    @cards.each do | card |
        if ['J' ,  'Q' ,  'K'].include?(card.rank)
            @total_value += 10
        elsif ['A'].include?(card.rank) && total_value >= 11  && total_value <= 20
         @total_value+=1
        elsif ['A'].include?(card.rank) && total_value <=10
            @total_value+=11
        else
            @total_value += card.rank.to_i
        end
    end
     @total_value
  end
end
