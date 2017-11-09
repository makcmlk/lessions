require_relative 'carriage'

class PassengerCar < Carriage
  def occupy(size = 1)
    super(size)
  end
end
