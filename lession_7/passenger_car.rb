require_relative 'carriage'

class PassengerCar < Carriage
  def take_a_seat
    @occupied += 1 if @occupied < @volume
  end
end
