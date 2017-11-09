require_relative 'manufacturer'

class Carriage
  include Manufacturer
  attr_reader :volume, :occupied

  def initialize(volume)
    @volume = volume
    @occupied = 0
  end

  def free_space
    @volume - @occupied
  end

  def occupy(size)
    if @occupied + size <= @volume
      @occupied += size
      true
    end
  end
end
