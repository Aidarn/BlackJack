# frozen_string_literal: true

class Dealer < Player
  DEALER = 'Dealer'

  def initialize
    @name = DEALER
    @bank = 100
  end
end
