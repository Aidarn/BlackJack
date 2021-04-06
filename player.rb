# frozen_string_literal: true

class Player
  attr_accessor :bank, :score
  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @bank = 100
    @cards = []
    @score = 0
  end

  def show_card
    @cards
  end

  def show_bank
    @bank
  end

  def bet
    @bank -= 10
  end

  def size
    @cards.size
  end

  def add_card(deck)
    @cards << deck.cards.pop
    @score += @cards.last.score
  end

  def show_score
    @score
  end
end
