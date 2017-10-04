require './train.rb'
require './cargocar.rb'

class CargoTrain < Train
  def add_car(new_car)
    super(new_car) if new_car.class.name == 'CargoCar'
    puts "AZAZAZ #{@cars.size}"
  end
end
