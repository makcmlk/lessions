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
    puts "Station #{name} (#{@stations.find_index()})is created #{@stations.size}"
  end

  def new_c_train(number)
    @trains.push(CargoTrain.new(number))
    puts "Cargo train #{number} is created /n"
  end

  def new_p_train(number)
    @trains.push(PassengerTrain.new(number))
    print "Passenger train #{number} is created"
  end

  def set_route(train, new_route)
    train.route(new_route)
    print "Train #{train.number} has a #{new_route} route"
  end

  def new_route(from, to)
    @route.push(Route.new(from, to))
    print "New route #{from} to #{to} is set"
  end

  def add_in_route(route, station, order)
    route.add_station(station, order)
    print "New route #{from} to #{to} is set"
  end

  def delete_from_route(route, station)
    route.delete_station(station, order)
    print "station #{station} is deleted from #{route}"
  end

  def route_to_train(train, new_route)
    train.route(new_route)
    print "Route #{new_route} is set to #{train}"
  end

  def add_car_to(train)
    if train.class == PassengerTrain
      train.add_car(PassengerCar.new)
      print "New Passenger Car is added into train No #{train.number}"
    end
    elseif train.class == CargoTrain
    train.add_car(CargoCar.new)
    print "New Cargo Car is added into train No #{train.number}"
  end

  def delete_car_from(train)
    train.delete_car
    print "Car is deleted from #{train.number}"
  end

  def go_next(train)
    train.next_station
    print "#{train.number} is going to the next station"
  end

  def go_prev(train)
    train.prev_station
    print "#{train.number} is going to the previous station"
  end

  def list_of_trains(station)
    station.list_of_trains.each { |train| puts "train  No #{train.number}, type #{train.type}" }
  end

  def list_of_stations
    @stations.each { |station| puts "Station #{station.name}, #{station.list_of_trains.size} trains"}
  end
end

rzd = Railway.new
rzd.new_station('Moscow')
rzd.new_station('Rostov')
rzd.new_station('Saint_P')
rzd.new_station('Kazan')
rzd.new_c_train(1111)
rzd.new_p_train(2222)
rzd.new_route(@stations.at(0), @stations.at(0))
rzd.add_in_route(@routes.first, @stations[1], 1)
rzd.add_in_route(@routes.first, @stations[2], 2)
rzd.delete_from_route(@routes.first, @stations[2])
rzd.set_route(@trains.first, @routes.first)
rzd.set_route(@trains.last, @routes.first)
rzd.go_next(@trains.first)
rzd.list_of_trains(@stations.first)
rzd.list_of_trains(@stations[1])
rzd.list_of_stations
