# frozen_string_literal: true

class Card
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
