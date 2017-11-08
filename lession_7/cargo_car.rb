require_relative 'carriage'

class CargoCar < Carriage
  def take_a_volume
    @occupied += 100 if @occupied + 100 <= @volume
  end
end
