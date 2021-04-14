# frozen_string_literal: true

class Card
  CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10].freeze
  SUITS = ['♦', '♠', '♣', '♥'].freeze
  PICTURES = %w[J Q K A].freeze
  attr_reader :suit, :value, :pic

  def initialize(suit, value, pic = 0)
    @pic = pic
    @suit = suit
    @value = value
  end

  def score
    @score = @value.to_i
  end
end
