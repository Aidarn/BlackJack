require_relative 'interface'
require_relative "player"
require_relative "dealer"
require_relative "card"
require_relative "deck"

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
        dealer = Dealer.new
        puts "Введите имя игрока"
        name = gets.chomp
        player = Player.new(name)
        puts MENU
        game
      else
        
        action_menu = gets.chomp.to_i
        selected_action(action_menu)
      end
    end
  end

  def start
    
  end

  def game
    @game += 1
  end
end

game = Game.new
game.run