class Player
  attr_accessor :name

  def initialize(name)
    @name = name
    @player_bank = 100
  end
end