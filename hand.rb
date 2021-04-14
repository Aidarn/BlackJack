# frozen_string_literal: true

class Hand
  attr_accessor :cards, :size, :score

  def initialize
    @cards = []
    @score = 0
    @size = 0
  end

  def add_score(card)
    if card.pic == 'A'
      score = if score >= 11
                1
              else
                10
              end
      @score += score
    else
      @score += @cards.last.value.to_i
    end
  end
end
