require_relative './validation'

class Station
  include Validation

  FORMAT_NAME = /^[a-z]$/i

  attr_accessor :name
  validate :name, :presence
  validate :name, :format, FORMAT_NAME

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations.push(self)
  end

  def each_train
    @trains.each { |train| yield(train) }
  end

  def get_train(train)
    @trains.push(train) if train.is_a?(Train)
  end

  def send_train(train)
    @trains.delete(train) if train.is_a?(Train)
  end

  def list_of_trains
    @trains
  end

  protected

#  def validate!
#    raise "Name of station can't be empty" if name.nil?
#    raise 'Name of station should be at least 3 symbols' if name.length < 3
#  end

  private

  # never use that
  def list_of_trains_by(type)
    puts "List of trains type #{type}"
    @trains.each do |train|
      puts "train  No #{train.number}, type #{train.type}" if train.type == type
    end
  end
end
