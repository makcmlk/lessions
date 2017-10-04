class Station
  attr_accessor :name
  def initialize(name)
    @name = name
    @trains = []
  end

  def get_train(train)
    @trains.push(train)
    puts "Train No #{@trains.last.number} is on the station #{@name}"
  end

  def list_of_trains
    @trains
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
