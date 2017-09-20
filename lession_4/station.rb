class Station
  attr_accessor :name
  def initialize(name)
    @name = name
    @list_of_trains = []
  end

  def get_train(train)
    @list_of_trains.insert(train)
  end

  def list_of_trains
    @list_of_trains
  end

private
# не используем этот метод
  def list_of_trains_by(type)
    puts "List of trains type #{type}"
    @list_of_trains.each do |train|
      puts "train  No #{train.number}, type #{train.type}" if train.type == type
    end
  end
end
