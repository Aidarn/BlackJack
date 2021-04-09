# frozen_string_literal: true

class Dealer < Player
  DEALER = 'Dealer'

  def initialize(name = DEALER)
    super
  end

  def forbidden_take_card?
    @score > 16
  end
end
