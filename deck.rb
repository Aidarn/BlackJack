# frozen_string_literal: true

class Deck
  CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10].freeze
  SUITS = ['♦', '♠', '♣', '♥'].freeze
  PICTURES = ['J', 'Q', 'K', 'A']
  attr_reader :cards

  def initialize
    @cards = create_deck
  end

  def create_deck
    cards = []
    SUITS.each do |suit|
      CARD_VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end
    SUITS.each do |suit|
      PICTURES.each do |pic|
        value = 10.1
        cards << Card.new(suit, pic, value)
      end
    end
    cards.shuffle
  end
end
