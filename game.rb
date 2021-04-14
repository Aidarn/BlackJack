# frozen_string_literal: true

class Game
  def initialize(player, dealer, interface)
    @player = player
    @dealer = dealer
    @interface = interface
    @game = 0
    @stop = 1
    @cards = []
    @general_bank = 0
  end

  def run
    loop do
      if @stop.zero?
        @interface.program_end
        break
      elsif @game.zero?
        @interface.hello(@player)
        create_initial_data
        @game += 1
      elsif @player.hand.size > 2
        @interface.stop
        open_card
      else
        @interface.start_menu
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
    @interface.show_info(@dealer, @player)
    end_of_game
    retry_part?
  end

  def retry_part?
    @interface.retry?(@dealer, @player)
    retry_part = gets.chomp.to_i
    if retry_part == 1
      clear
      create_initial_data
    else
      stop
    end
  end

  def clear
    @player.clear_hand
    @dealer.clear_hand
  end

  def skip_a_move
    @interface.skip
    take_a_card(2)
  end

  def take_a_card(user)
    case user
    when 1
      add_card_to_user
      @interface.show_player_score(@player)
      take_a_card(2)
    when 2
      @interface.dealer_move
      add_card_to_dealer
    end
  end

  def create_initial_data
    @deck = Deck.new
    2.times do
      add_card_to_user
      add_card_to_dealer
    end
    place_a_bet
    @interface.show_hidden_dealer_info(@dealer)
    @interface.show_player_info(@player)
  end

  def place_a_bet
    @general_bank += 20
    @dealer.bet
    @player.bet
    @interface.bets_are_made
  end

  def add_card_to_dealer
    if !(@dealer.forbidden_take_card? || @size == 3)
      card = @deck.cards.last
      @deck.delete
      @dealer.add_card(card)
    else
      @interface.skip
    end
  end

  def add_card_to_user
    card = @deck.cards.last
    @deck.delete
    @player.add_card(card)
  end

  def end_of_game
    checking_the_winner
  end

  def checking_the_winner
    if @dealer.hand.score <= 21
      dealer_check
    elsif @dealer.hand.score > 21 && @player.hand.score > 21
      draw
    elsif @dealer.hand.score > 21
      player_win
    elsif @player.hand.score > 21
      dealer_win
    end
  end

  def dealer_check
    if @dealer.hand.score > @player.hand.score
      dealer_win
    elsif @dealer.hand.score == @player.hand.score
      draw
    elsif @player.hand.score > 21
      dealer_win
    else
      player_win
    end
  end

  def draw
    @interface.draw
    @player.win(@general_bank / 2)
    @dealer.win(@general_bank / 2)
    @general_bank = 0
  end

  def player_win
    @interface.player_win
    @player.win(@general_bank)
    @general_bank = 0
  end

  def dealer_win
    @interface.dealer_win
    @dealer.win(@general_bank)
    @general_bank = 0
  end

  def stop
    @stop = 0
  end
end
