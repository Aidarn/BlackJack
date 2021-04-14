# frozen_string_literal: true

require_relative 'hand'
require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'
require_relative 'terminal_interface'
require_relative 'game'

class BlackJack
  attr_reader :game

  def initialize
    dealer = Dealer.new
    player = Player.new
    interface = TerminalInterface.new
    @game = Game.new(player, dealer, interface)
  end

  def start_game
    game.run
  end
end

BlackJack.new.start_game
