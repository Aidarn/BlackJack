# frozen_string_literal: true

class TerminalInterface
  START = <<~HERE
    1 - Пропустить.
    2 - Добавить карту.
    3 - Открыть карты.
  HERE

  def start_menu
    puts START
  end

  def stop
    puts 'Автоматическое завершение игры по достижению 3 карт'
  end

  def retry?(dealer, player)
    puts "Баланс дилера: #{dealer.bank}"
    puts "Ваш баланс: #{player.bank}"
    puts 'Хотите сыграть ещё раз? 1-Да, 2-Нет'
  end

  def program_end
    puts 'Игра остановлена'
  end

  def hello(player)
    puts 'Приветствуем вас в игре "BLACK JACK". Введите имя игрока:'
    name = gets.chomp
    player.name = name
  end

  def show_info(dealer, player)
    show_dealer_info(dealer)
    show_player_info(player)
  end

  def show_dealer_info(dealer)
    puts 'Дилер:'
    puts '  Карты:'
    dealer.show_card.each_with_index do |card, index|
      puts "    Карта:#{index}-#{card.suit}#{card.value}" if card.value != 10.1
      puts "    Карта:#{index}-#{card.suit}#{card.pic}" if card.value == 10.1
    end
    puts "  Очки:#{dealer.hand.score}"
  end

  def show_hidden_dealer_info(dealer)
    puts 'Дилер:'
    puts '  Карты:'
    dealer.show_card.each_with_index { |_card, index| p "    Карта:#{index}-****" }
  end

  def show_player_info(player)
    puts "\nИгрок:#{player.name}"
    puts '  Карты:'
    player.show_card.each_with_index do |card, index|
      puts "    Карта:#{index}-#{card.suit}#{card.value}" if card.value != 10.1
      puts "    Карта:#{index}-#{card.suit}#{card.pic}" if card.value == 10.1
    end
    puts " Очки:#{player.hand.score}"
  end

  def skip
    puts 'Ход пропущен'
  end

  def dealer_move
    puts 'Ход дилера'
  end

  def show_player_score(player)
    puts "Сумма очков с карт: #{player.hand.score}"
  end

  def bets_are_made
    puts 'Ставки сделаны'
  end

  def dealer_win
    puts 'Победил дилер, ставка переходит к дилеру'
  end

  def player_win
    puts 'Вы победили, ставка переходит к вам'
  end

  def draw
    puts 'Ничья, банк возвращается'
  end
end
