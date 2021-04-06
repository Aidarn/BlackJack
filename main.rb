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
    @cards = []
    @general_bank = 0
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
        @game += 1
      else
        puts START
        action_menu = gets.chomp.to_i
        start(action_menu)
      end
    end
  end

  def start(action_menu)
    case action_menu
    when 1
      skip_a_move
    when 2
      take_a_card(1)
    when 3
      open_card
    when 4
      show_info #Убрать или изменить
    end
  end

  def show_info #Убрать
    puts " #{@dealer.show_score} Очки"#Убрать
    puts " #{@dealer.show_bank} Банк"#Убрать
    puts " #{@dealer.size} Карты"#Убрать
    @dealer.cards.each_with_index { |card, index| puts "#{card}," }
    puts "Игрок:"#Убрать
    puts " #{@player.show_score} Очки"#Убрать
    puts " #{@player.show_bank} Банк"#Убрать
    puts " #{@player.size} Карты"#Убрать
    @deck.show_card.each_with_index { |cards, index| print "#{index},"}#Убрать
    puts "Общий банк #{@general_bank}"
  end

  def take_a_card(user)
    case user
    when 1
      add_card_to_user
      puts "Ваш баланс: #{@player.show_bank}"
      puts "Сумма очков с карт: #{@player.show_score}"
    when 2
      add_card_to_dealer
    end
  end

  def create_initial_data
    2.times do
      add_card_to_user
      add_card_to_dealer
    end
    place_a_bet
  end

  def place_a_bet
    @general_bank += 20
    @dealer.bet
    @player.bet
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
