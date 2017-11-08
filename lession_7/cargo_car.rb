require_relative 'carriage'

class CargoCar < Carriage
  def take_a_volume(size)
    @occupied += size if @occupied + size <= @volume
  end
end
