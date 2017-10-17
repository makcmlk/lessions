class Station
  attr_accessor :name

  @@stations = []

  class << self
    def all
      @stations
    end
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations.push(self)
  end

  def get_train(train)
    if train.is_a?(Train)
      @trains.push(train)
    end
  end

  def send_train(train)
    if train.is_a?(Train)
      @trains.delete(train)
    end
  end

  def list_of_trains
    @trains
  end

  protected

  def validate!
    raise "Name of station can't be empty" if name.nil?
    raise 'Name of station should be at least 3 symbols' if name.length < 3
    true
  end

  private

  # не используем этот метод
  def list_of_trains_by(type)
    puts "List of trains type #{type}"
    @trains.each do |train|
      puts "train  No #{train.number}, type #{train.type}" if train.type == type
    end
  end
end
