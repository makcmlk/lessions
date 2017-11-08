require_relative 'manufacturer'

class Carriage
  include Manufacturer
  attr_reader :volume, :occupied

  def initialize(volume)
    @volume = volume
    @occupied = 0
  end
end
