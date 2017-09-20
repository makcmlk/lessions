require './train.rb'
require './passengercar.rb'

class PassengerTrain < Train
  def add_car(new_car)
    super if new_car.class == PassengerCar
  end
end
