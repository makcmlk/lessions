

class Train
  attr_accessor :number
  attr_accessor :type
  def initialize(number, type, count_of_cars)
    @number = number
    @type = type
    @count_of_cars = count_of_cars
    @speed = 0
  end

  def route(route)
    @route = route
    "route of #{train.number} is changed"
  end

  def speed
    puts "speed of train is #{@speed}"
  end

  def up_speed
    puts 'Up speed! too! too!'
    @speed += 60
  end

  def stop
    puts 'Train is stoped'
    @speed = 0
  end

  def add_car
    if @speed.zero?
      @count_of_cars += 1
      puts "car is added. count of cars: #{@count_of_cars}"
    else
      puts 'can not add a car on the move'
    end
  end

end

class Station
  attr_accessor :name
  def initialize(name)
    @name = name
    @list_of_trains = {}
  end

  def get_train(train)
    @list_of_trains[train.number] = train.type
  end

  def list_of_trains()
    puts "List of trains type type #{type}"
    @list_of_trains.each { |train, type| puts "train  No#{train}, type #{type}" }
  end

  def get_list_of_trains_by_type(type)
    puts "List of trains type type #{type}"
    @list_of_trains.invert.values_at(type).each { |x| puts "train number #{x}" }
  end

  def send_train(train)
    puts "train #{train.number} is on the route"
    @list_of_trains.delete(train.number)
  end
end

class Route
  def initialize(from, to)
    @stations = [from, to]
  end

  def add_station(station, order)
    if order <= @stations.size
      @stations.insert(order, station)
      puts "#{station.name} is in the route"
    else
      puts 'Station is not in the route'
    end
  end

  def delete_station(station)
    puts "#{station.name} is deleted from route"
    @stations.delete_if { |x| x == station }
  end

  def list
    puts 'Stations in this route:'
    @stations.each { |station| puts station.name }
  end
end
