class Dealer
  attr_accessor :dealer_bank
  attr_reader :name, :hand

  DEALER = 'Dealer'

  def initialize
    @name = DEALER
    @dealer_bank = 100
    @hand = Hand.new
  end

  def add_card(card)
   
  end
end