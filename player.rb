class Player
  attr_accessor :player_bank
  attr_reader :name, :hand

  def initialize(name)
    @name = name
    @player_bank = 100
    @hand = Hand.new
  end

  def add_card(card)
  
  end
end