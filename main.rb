# frozen_string_literal: true

require_relative 'interface'
require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

class Game
  def initialize
    @game = 0
    @stop = 1
  end

  def run
    loop do
      if @stop.zero?
        puts PROGRAMM_END
        break
      elsif @game.zero?
        @deck = Deck.new
        @dealer = Dealer.new
        puts 'Введите имя игрока'
        name = gets.chomp
        @player = Player.new(name)
        puts MENU
        create_initial_data
      else
        puts "Карты игрока #{@player.show_card}" # Убрать
        puts "Карты компьютера #{@dealer.show_card}" # Убрать
        action_menu = gets.chomp.to_i
        start(action_menu)
      end
    end
  end

  def create_initial_data
    2.times do
      add_card_to_user
      add_card_to_dealer
    end
    @game += 1
  end

  def add_card_to_dealer
    @dealer.add_card(@deck)
  end

  def add_card_to_user
    @player.add_card(@deck)
  end
end

game = Game.new
game.run
