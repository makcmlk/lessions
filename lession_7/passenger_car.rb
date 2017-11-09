require_relative 'carriage'

class PassengerCar < Carriage
  def occupy(size)
    super(1)
  end
end
