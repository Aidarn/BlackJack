# frozen_string_literal: true

class Player
  attr_accessor :bank, :score, :cards, :name
  attr_reader :hand, :size

  def initialize
    @name = name
    @bank = 100
    @hand = Hand.new
  end

  def show_score
    @score
  end

  def show_card
    @hand.cards
  end

  def clear_hand
    @hand = Hand.new
  end

  def add_card(card)
    @hand.cards << card
    @hand.add_score(card)
    @hand.size += 1
  end

  def win(bet)
    @bank += bet
  end

  def bet
    @bank -= 10
  end
end
