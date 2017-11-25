require_relative './station'
require_relative './route'
require_relative './cargo_train'
require_relative './passenger_train'
require_relative './passenger_car'
require_relative './cargo_car'

# railway class
class Railway
  attr_reader :routes

  def initialize
    @stations = []
    @trains = []
    @routes = []
    puts 'Welcome to The Railway!'
  end

  def new_station(name)
    @stations.push(Station.new(name))
  end

  def new_c_train(name)
    @trains.push(CargoTrain.new(name))
    @trains.last.number
  end

  def new_p_train(name)
    @trains.push(PassengerTrain.new(name))
    @trains.last.number
  end

  def type_of_train(train_number)
    @trains[train_number].class
  end

  def set_route(train_number, route_number)
    return unless train_number < @trains.size && route_number < @routes.size
    @trains[train_number].route(@routes[route_number])
    @routes[route_number].station(0).get_train(@trains[train_number])
    @routes[route_number].list
  end

  def new_route(from, to)
    return unless from < @stations.size + 1 && to < @stations.size + 1
    @routes.push(Route.new(@stations[from], @stations[to]))
    @routes.last.list
  end

  def route(number)
    @routes[number].list
  end

  def add_in_route(route_number, station_number, order)
    return unless !@stations[station_number].nil? && !@routes[route_number].nil?
    @routes[route_number].add_station(@stations[station_number], order)
    @routes[route_number].list
  end

  def delete_from_route(route_num, stat_num)
    return unless stat_num < @routes[route_num].size && route_num < @routes.size
    @routes[route_nmbr].delete_station(@stations[stat_number])
    @routes[route_nmbr].list
  end

  def size_of(train_number)
    @trains[train_number].count_of_cars
  end

  def cars_of(train_number, block)
    @trains[train_number].each_car(&block)
  end

  def occupy_place(train_number, volume = nil)
    @trains[train_number].occupy_place(volume)
  end

  def add_car_to(train_number, volume)
    if @trains[train_number].is_a?(PassengerTrain)
      @trains[train_number].add_car(PassengerCar.new(volume))
      @trains[train_number].number
    end
    return unless @trains[train_number].is_a?(CargoTrain)
    @trains[train_number].add_car(CargoCar.new(volume))
    @trains[train_number].number
  end

  def delete_car_from(train_number)
    @trains[train_number].delete_car
  end

  def current_station(train_number)
    @trains[train_number].current_station
  end

  def go_next(number)
    return unless number <= @trains.size && !@trains[number].next_station.nil?
    @trains[number].current_station.send_train(@trains[number])
    next_station = @trains[number].move_next
    next_station.get_train(@trains[number])
  end

  def go_prev(numbr)
    return unless numbr <= @trains.size && !@trains[numbr].current_station.nil?
    @trains[number].current_station.send_train(@trains[number])
    previous_station = @trains[number].move_prev
    previous_station.get_train(@trains[number])
  end

  def list_of_trains(number, block)
    @stations[number].each_train(&block) if number <= @stations.size - 1
  end

  def list_of_all_trains
    @trains
  end

  def list_of_stations
    @stations
  end
end
