require_relative 'carriage'

class PassengerCar < Carriage
  def occupy(_size)
    super(1)
  end
end
