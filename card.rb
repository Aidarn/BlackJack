# frozen_string_literal: true

class Card
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def score
    score = @value.to_i
  end
end
