require './train.rb'
require './passengercar.rb'

class PassengerTrain < Train
  def add_car(new_car)
    super(new_car) if new_car.class.name == 'PassengerCar'
  end
end
