require "spec_helper"

describe Hand do
  # These UTF-8 characters will be useful for making different hands:
  # '♦', '♣', '♠', '♥'

  let(:hand) { Hand.new([Card.new("♦",10), Card.new("♥","J")]) }
  let(:hand_two_aces) { Hand.new([Card.new("♦","A"), Card.new("♥","A")]) }
  let(:hand_three_aces) { Hand.new([Card.new("♦","A"), Card.new("♥","A"), Card.new("♣","A")]) }
  let(:hand_twenty) { Hand.new([Card.new("♦",10), Card.new("♥","10")]) }
  let(:hand_ace_flips_to_one_twentyone) { Hand.new([Card.new("♦",10), Card.new("♥","10"), Card.new("♦","A")]) }
  # # You can add more sample hands

  describe "#calculate_hand" do
      context "should calculate value of hand 10 and ♥J(10)" do
          it "it should be able to calculate value of one 10 one face card" do
              expect(hand.calculate_hand).to eq(20)
          end
      end
      context "should calculate value of two aces as 11+1 (12)" do
          it "it should be able to calculate value of two Aces of value 1 and 11" do
              expect(hand_two_aces.calculate_hand).to eq(12)
          end
      end
      context "should calculate value of three aces as 11+1 +1 (13)" do
          it "it should be able to calculate value of two Aces of value 1 and 11" do
              expect(hand_three_aces.calculate_hand).to eq(13)
          end
      end
      context "should calculate value of two 10s to 20" do
          it "it should be able to calculate value of two cards of value 10" do
              expect(hand_twenty.calculate_hand).to eq(20)
          end
      end
      context "should calculate value 2 10 cards and flip ace to 1 (21)" do
          it "it should be able to calculate value of two 10s and one Ace" do
              expect(hand_ace_flips_to_one_twentyone.calculate_hand).to eq(21)
          end
      end


  end
end
