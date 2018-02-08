
class Hand
    attr_reader :cards, :total_value
    def initialize
        @cards = []
        @total_value = 0
    end
    def add_card(card)
        @cards << card
    end
end
