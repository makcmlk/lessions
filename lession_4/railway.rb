require './station.rb'
require './route.rb'
require './cargotrain.rb'
require './passengertrain.rb'
require './passengercar.rb'
require './cargocar.rb'

class Railway
  def initialize
    @stations = []
    @trains = []
    @routes = []
    puts 'New railway is created! /n'
  end

  def new_station(name)
    @stations.push(Station.new(name))
    puts "Station #{name} is created. (total: #{@stations.size})"
  end

  def new_c_train
    @trains.push(CargoTrain.new(@trains.size))
    puts "Cargo train #{@trains.last.number} is created"
  end

  def new_p_train
    @trains.push(PassengerTrain.new(@trains.size))
    puts "Passenger train #{@trains.last.number} is created"
  end

  def set_route(train_number, route_number)
    @trains[train_number].route(@routes[route_number])
    puts "Route #{@routes[route_number].list} is set to train No #{@trains[train_number].number}"
    @routes[route_number].station(0).get_train(@trains[train_number])
  end

  def new_route(from, to)
    if from < @stations.size + 1 && to < @stations.size + 1
      @routes.push(Route.new(@stations[from], @stations[to]))
      puts "New route #{@stations[from].name} to #{@stations[to].name} is created"
    end
  end

  def routes
    puts '--- List of existing routes -----'
    @routes.each_with_index { |route, index| puts "#{index}:  #{route.list}" }
  end

  def route(number)
    @routes[number].list
  end

  def add_in_route(route_number, station_number, order)
    if !@stations[station_number].nil? && !@routes[route_number].nil?
      @routes[route_number].add_station(@stations[station_number], order)
      puts "Station #{@stations[station_number].name} is in route #{@routes[route_number].list}"
    else
      puts 'Error!'
    end
  end

  def delete_from_route(route_number, station_number)
    if !@stations[station_number].nil? && !@routes[route_number].nil?
      @route[route_number].delete_station(@stations[station_number])
      puts "Now #{@stations[station_number]} is not in route #{@routes[route_number].list}"
    else
      puts 'Error!'
    end
  end

  def size_of(train)
    train.count_of_cars
  end

  def add_car_to(train_number)
    if @trains[train_number].class == PassengerTrain
      @trains[train_number].add_car(PassengerCar.new)
      puts "New Passenger Car is added into train No #{@trains[train_number].number}"
    end
    if @trains[train_number].class == CargoTrain
      @trains[train_number].add_car(CargoCar.new)
      puts "New Cargo Car is added into train No #{@trains[train_number].number}"
    end
  end

  def delete_car_from(train_number)
    @trains[train_number].delete_car
  end

  def current_station(train_number)
    @trains[train_number].current_station
  end

  def go_next(train_number)
    if train_number <= @trains.size
      puts "Train No. #{@trains[train_number].number} is"
      @trains[train_number].move_next.get_train(@trains[train_number])
    end
  end

  def go_prev(train_number)
    if train_number <= @trains.size
      puts "Train No. #{@trains[train_number].number} is"
      @trains[train_number].move_prev.get_train(@trains[train_number])
    end
  end

  def list_of_trains(number_of_station)
    puts "List of trains on station #{@stations[number_of_station].name}"
    puts @stations[number_of_station].list_of_trains.each { |train| puts "train  No #{train.number}, size: #{train.count_of_cars}"}
  end

  def list_of_all_trains
    puts '--- List of trains ---------------'
    @trains.each { |train| puts "train  No #{train.number}, size: #{train.count_of_cars}"}
  end

  def list_of_stations
    number = 0
    @stations.each_with_index { |station, index| puts "#{index} - Station #{station.name}, #{station.list_of_trains.size} trains"}
  end
end
