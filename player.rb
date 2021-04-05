class Player
  attr_accessor :player_bank
  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @bank = 100
    @cards = [] 
  end

  def show_card 
    puts "#{@cards}"
  end

  def add_card(card)
    @cards << card
  end
end