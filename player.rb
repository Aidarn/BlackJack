# frozen_string_literal: true

class Player
  attr_accessor :bank
  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @bank = 100
    @cards = []
  end

  def show_card
    puts @cards
  end

  def add_card(deck)
    @cards << deck.cards.pop
  end
end
