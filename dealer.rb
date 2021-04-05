# frozen_string_literal: true

class Dealer < Player
  DEALER = 'Dealer'

  def initialize
    @name = DEALER
    @bank = 100
    @cards = []
    @score = 0
  end

  def add_card(deck)
    raise "#{@name} пропускает ход." if forbidden_take_card? || size == 3
    super
  end

  def forbidden_take_card?
    @score > 16
  end
end

