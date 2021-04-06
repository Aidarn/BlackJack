# frozen_string_literal: true

class Card
  attr_reader :suit, :value, :pic

  def initialize(suit, pic = 0, value)
    @pic = pic
    @suit = suit
    @value = value
  end

  def score
    @score = @value.to_i
  end
end
