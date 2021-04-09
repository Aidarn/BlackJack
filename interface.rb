# frozen_string_literal: true

module Interface
  HELLO = 'Приветствуем вас в игре "BLACK JACK"'

  PROGRAMM_END = 'Игра остановлена'

  START = <<~HERE
    1 - Пропустить.
    2 - Добавить карту.
    3 - Открыть карты.
  HERE

  NEXT = 'Ход пропущен, ход перешёл к дилеру'

  DEAL = 'Ход дилера'

  MENU = '______________'

  DEALER_WIN = 'Победил дилер, ставка переходит к дилеру'

  PLAYER_WIN = 'Вы победили, ставка переходит к вам'

  DRAW = 'Ничья, банк возвращается'

  STOP = 'Автоматическое завершение игры по достижению 3 карт'

  RETRY = <<~HERE
    Хотите сыграть ещё раз?
    1 - Да
    2 - Нет
  HERE

  def show_info
    show_dealer_info
    show_player_info
  end

  def show_dealer_info
    puts 'Дилер:'
    puts '  Карты:'
    @dealer.show_card.each_with_index do |card, index|
      puts "    Карта:#{index}-#{card.suit}#{card.value}" if card.value != 10.1
      puts "    Карта:#{index}-#{card.suit}#{card.pic}" if card.value == 10.1
    end
    puts "  Очки:#{@dealer.score}"
  end

  def show_hidden_dealer_info
    puts 'Дилер:'
    puts '  Карты:'
    @dealer.show_card.each_with_index { |_card, index| p "    Карта:#{index}-****" }
  end

  def show_player_info
    puts "\nИгрок:#{@player.name}"
    puts '  Карты:'
    @player.show_card.each_with_index do |card, index|
      puts "    Карта:#{index}-#{card.suit}#{card.value}" if card.value != 10.1
      puts "    Карта:#{index}-#{card.suit}#{card.pic}" if card.value == 10.1
    end
    puts " Очки:#{@player.score}\n\n"
  end
end
