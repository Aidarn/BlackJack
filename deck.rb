# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = create_deck
  end

  def create_deck
    cards = []
    Card::SUITS.each do |suit|
      Card::CARD_VALUES.each do |value|
        cards << Card.new(suit, value)
      end
      Card::PICTURES.each do |pic|
        value = 10.1
        cards << Card.new(suit, value, pic)
      end
    end
    cards.shuffle
  end

  def delete
    @cards.pop
  end
end
