# frozen_string_literal: true

class Player
  attr_accessor :bank, :score, :cards
  attr_reader :name, :hand, :size

  def initialize(name)
    @name = name
    @bank = 100
    @cards = []
    @score = 0
    @size = 0
    validate!
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

  def add_card(deck)
    @cards << deck.cards.pop
    @score += @cards.last.score
    @size += 1
  end

  private

  def validate!
    raise 'Имя не может быть пустым.' if @name.empty?
  end
end
