class Game

  def initialize
    @stop = 1
    @game = 0
  end

  def run
    loop do
      if @stop.zero?
        puts PROGRAMM_END
        break
      elsif @game.zero?
        dealer = Dealer.new
        name = gets.chomp
        player = Player.new(name)
        @game += 1
      else
      end
    end
  end
  
  def stop
    @stop = 0
  end
  
end

game = Game.new
game.run