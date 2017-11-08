require_relative 'manufacturer'

class Carriage
  include Manufacturer
  attr_reader :volume

  def initialize(volume)
    @volume = volume
    @occupied = 0
  end

  def occupied
    @occupied
  end

  def free_space
    @volume - @occupied
  end
end
