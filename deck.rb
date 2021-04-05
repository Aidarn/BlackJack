class Deck 
  SUITS = ['♦', '♠', '♣', '♥'].freeze
  CARD_VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10].freeze
  PICTURES = ['J', 'Q', 'K', 'A'].freeze

  def inintialize
    @cards = create_deck
  end

  def create_deck
    SUITS.each do |suit|
      CARD_VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end
    SUITS.each do |suit|
      PICTURES.each do |value|
        cards << Card.new(suit, value)
      end
    end

    cards.shuffle
  end
end
