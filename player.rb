# frozen_string_literal: true

class Player
  attr_accessor :bank
  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @bank = 100
  end

  def show_card
    puts @cards.to_s
  end

  def add_card(deck)
    @cards.push(deck.cards.pop)
  end
end
