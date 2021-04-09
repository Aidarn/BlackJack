# frozen_string_literal: true

require_relative 'interface'
require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

class Game
  include Interface

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
        puts HELLO
        create_initial_data
        @game += 1
      elsif @player.size == 3
        puts STOP
        open_card
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
      open_card_hidden
    end
  end

  def open_card_hidden
    show_hidden_dealer_info
    show_player_info
  end

  def open_card
    show_info
    end_of_game
    retry_part?
  end

  def retry_part?
    puts RETRY
    retry_part = gets.chomp.to_i
    if retry_part == 1
      clear
      create_initial_data
    else
      stop
    end
  end

  def clear
    @deck = Deck.new
    @player.cards.clear
    @dealer.cards.clear
    @player.score = 0
    @dealer.score = 0
  end

  def skip_a_move
    puts NEXT
    take_a_card(2)
  end

  def take_a_card(user)
    case user
    when 1
      add_card_to_user
      puts "Сумма очков с карт: #{@player.score}"
      take_a_card(2)
    when 2
      puts DEAL
      add_card_to_dealer
    end
  end

  def create_initial_data
    2.times do
      add_card_to_user
      add_card_to_dealer
    end
    puts 'Ставки сделаны!'
    place_a_bet
    puts "Ваш баланс: #{@player.show_bank}"
    puts "Баланс дилера: #{@dealer.show_bank}"
    show_hidden_dealer_info
    puts MENU
    show_player_info
  end

  def place_a_bet
    @general_bank += 20
    @dealer.bet
    @player.bet
  end

  def add_card_to_dealer
    if !(@dealer.forbidden_take_card? || @size == 3)
      @dealer.add_card(@deck)
    else
      puts 'Дилер пропускает ход'
    end
  end

  def add_card_to_user
    @player.add_card(@deck)
  end

  def end_of_game
    checking_the_winner
  end

  def checking_the_winner
    if @dealer.score <= 21
      dealer_check
    elsif @dealer.score > 21 && @player.score > 21
      draw
    elsif @dealer.score > 21
      player_win
    elsif @player.score > 21
      dealer_win
    end
  end

  def dealer_check
    if @dealer.score > @player.score
      dealer_win
    elsif @dealer.score == @player.score
      draw
    elsif @player.score > 21
      dealer_win
    else
      player_win
    end
  end

  def draw
    puts DRAW
    @player.bank += 10
    @dealer.bank += 10
    @general_bank -= 20
  end

  def player_win
    puts PLAYER_WIN
    @player.bank += @general_bank
    @general_bank = 0
  end

  def dealer_win
    puts DEALER_WIN
    @dealer.bank += @general_bank
    @general_bank = 0
  end

  def stop
    @stop = 0
  end
end

game = Game.new
game.run
