require_relative "card"
require_relative "deck"
require_relative "hand"
require 'pry'
class Blackjack
    attr_reader :player,:dealer, :play
    attr_accessor   :total_value, :dealer_total, :player_total, :outcome
    def initialize
        @player = Hand.new
        @dealer = Hand.new
        @deck = Deck.new
        play
        @outcome = outcome
    end

    def play
        puts "Welcome to Blackjack!\n\n"
         player_turn
         dealer_turn
         puts @outcome
    end


    def player_turn
        @total_value = 0
        player_hand = []
        input = nil

        2.times {player_hand << @deck.draw!}
        player_hand.each do | card |
            puts "Player was dealt #{card.value}#{card.suit} "
            if card.face_card?
                @total_value += 10
            elsif card.ace? && total_value >= 11  && total_value <= 20
                @total_value+=1
            elsif card.ace? && total_value <=10
                @total_value+=11
            else
                @total_value += card.value.to_i
            end
        end
        @player_total = total_value
        puts "Player score: #{@player_total}\n\n"
        if @player_total == 21
            puts "Player, you win! Blackjack! "
            exit
        end
        @player_total
        while input != 's'
          print "Hit or Stand (H/S):"
          input = gets.chomp.downcase
          while input != 's' && input != 'h'
            puts "Invalid Input\n"
            print "Hit or Stand (H/S):"
            input = gets.chomp.downcase
          end
          if input === 'h'
              player_hand << @deck.draw!
              recent_card =[]
              recent_card << player_hand[-1]
              puts "Player was dealt: #{player_hand[-1].value} #{player_hand[-1].suit}"
              recent_card.each do | card |
                  if card.face_card?
                      @player_total  += 10
                  elsif card.ace? && total_value >= 11  && total_value <= 20
                      @player_total+=1
                  elsif card.ace? && total_value <=10
                      @player_total+=11
                  else
                      @player_total += card.value.to_i
                  end
              end
              if @player_total > 21
                  puts "Player, You BUST! You Lose!"
                 exit
              elsif
                  @player_total == 21
                  puts "Player, you win! Blackjack! "
                  exit
              end
              puts "Player score: #{@player_total}"

          end
        end
    end
    def dealer_turn
        @total_value = 0
        dealer_hand = []
        2.times {dealer_hand << @deck.draw!}
        dealer_hand.each do | card |
            puts "Dealer was dealt #{card.value}#{card.suit} "
            if card.face_card?
                @total_value += 10
            elsif card.ace? && total_value >= 11  && total_value <= 20
                @total_value+=1
            elsif card.ace? && total_value <=10
                @total_value+=11
            else
                @total_value += card.value.to_i
            end
        end
         @dealer_total = total_value
           puts "Dealer score: #{@dealer_total}"
          while @dealer_total <= 17
              dealer_hand << @deck.draw!
              recent_card =[]
              recent_card << dealer_hand[-1]
              puts "Dealer was dealt: #{dealer_hand[-1].value} #{dealer_hand[-1].suit}"
              recent_card.each do | card |
                  if card.face_card?
                      @dealer_total  += 10
                  elsif card.ace? && total_value >= 11  && total_value <= 20
                       @dealer_total+=1
                  elsif card.ace? && total_value <=10
                       @dealer_total+=11
                  else
                       @dealer_total += card.value.to_i
                  end
              end
          end
          @dealer_total
          if @dealer_total > 21
              puts "Dealer Busts! Player, you win!"
               exit
          elsif
              @dealer_total == 21
              puts "Dealer wins! Blackjack! "
             exit

          end

    end

    def outcome
        if @dealer_total == @player_total
            puts "Game is a draw. No one wins"
        elsif  @dealer_total > @player_total && @dealer_total <21
            puts "Dealer wins!"
        elsif @dealer_total < @player_total  && @player_total <21
            puts " Player wins!"
            puts "Thank you for playing"
        end

    end


end
newgame = Blackjack.new
newgame
