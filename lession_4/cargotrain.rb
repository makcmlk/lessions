require './train.rb'
require './cargocar.rb'

class CargoTrain < Train
  def add_car(new_car)
    super if new_car.class == CargoCar
  end
end
