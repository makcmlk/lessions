class Train
  attr_accessor :number
  attr_accessor :type
  def initialize(number, type, count_of_cars)
    @number = number
    @type = type
    @count_of_cars = count_of_cars
    @speed = 0
  end

  def route(new_route)
    puts "route of #{@number} is changed"
    @route = new_route
    @station_number = 0
  end

  def current_station
    return @route.station(@station_number).name unless @route.nil?
  end

  def next_station
    if !@route.nil?
      return 'On the last station!' unless @station_number + 1 == @route.size
      @route.station(@station_number + 1).name
    else
      'no route!'
    end
  end

  def prev_station
    if !@route.nil?
      return puts 'On the first station!' unless @station_number.nonzero?
      @route.station(@station_number - 1).name
    else
      puts 'no route!'
    end
  end

  def move_next
    if !@route.nil?
      return puts 'you are in the end!' unless @station_number != @route.size
      @station_number += 1
    else
      puts 'no route!'
    end
  end

  def move_prev
    if !@route.empty?
      return puts 'On the first station!' unless @station_number.nonzero?
      @station_number -= 1
    else
      puts 'no route!'
    end
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

  def count_of_cars
    @count_of_cars
  end

  def add_car
    if @speed.zero?
      @count_of_cars += 1
      puts "car is added. count of cars: #{@count_of_cars}"
    else
      puts 'can not add a car on the move'
    end
  end

  def delete_car
    if @speed.zero? && @count_of_cars >= 1
      @count_of_cars -= 1
      puts "car is added. count of cars: #{@count_of_cars}"
    else
      puts 'can not add a car'
    end
  end
end

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
    puts 'List of trains type type'
    @list_of_trains.each { |train| puts "train  No #{train.number}, type #{train.type}" }
  end

  def get_list_of_trains(type)
    puts "List of trains type #{type}"
    @list_of_trains.each do |train|
      puts "train  No #{train.number}, type #{train.type}" if train.type == type
    end
  end

  def send_train(train)
    if !train.next_station.empty?
      puts "train #{train.number} is going to #{train.next_station}"
      train.move_next
      @list_of_trains.delete(train)
    else
      puts 'no route'
    end
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
    @stations.delete_if { |x| x == station }
  end

  def list
    puts 'Stations in this route:'
    @stations.each { |station| puts station.name }
  end

  def station(number)
    @stations[number]
  end

  def size
    @stations.size
  end
end

train1 = Train.new(001, 'PASS', 10)
train2 = Train.new(002, 'PASS', 9)
train3 = Train.new(003, 'PASS', 11)
train4 = Train.new(004, 'TOV', 8)
train5 = Train.new(005, 'TOV', 13)

station1 = Station.new('New York')
station2 = Station.new('Chicago')
station3 = Station.new('Washington')
station4 = Station.new('Detroit')
station5 = Station.new('Los Angeles')
station6 = Station.new('Miami')

route1 = Route.new(station1, station6)
route2 = Route.new(station2, station5)
route3 = Route.new(station3, station4)
route4 = Route.new(station2, station6)
route5 = Route.new(station3, station6)

route1.add_station(station2, 1)
route1.add_station(station3, 2)
route1.add_station(station4, 3)
route1.add_station(station5, 4)

route1.list
puts route1.station(1)
route1.delete_station(1)
route1.list

train1.route(route1)
puts train1.current_station
puts train1.next_station
train1.move_next
puts train1.current_station
train1.move_next
train1.move_next
puts train1.current_station
puts train1.next_station
puts train1.prev_station
train1.speed
train1.up_speed
train1.add_car
puts train1.count_of_cars
train1.stop
train1.add_car
puts train1.count_of_cars
