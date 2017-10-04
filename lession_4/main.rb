require './railway.rb'

def show_menu
  puts '--- Menu -------------------------'
  puts '0 - List of stations'
  puts '1 - List of trains'
  puts '2 - List of trains by station'
  puts '3 - Move train'
  puts '4 - Add an station'
  puts '5 - Add a train'
  puts '6 - Add a route'
  puts '7 - Set a route to train'
  puts '8 - Edit route'
  puts '9 - Add a carriage to train'
  puts '10 - Unhook the carriage'
end

def list_of_stations(railroad)
  railroad.list_of_stations
end

def list_of_trains(railroad)
  railroad.list_of_all_trains
end

def trains_on_station(railroad)
  railroad.list_of_stations
  puts 'Enter number of station: '
  input = gets.chomp.to_i
  railroad.list_of_trains(input)
end

def add_station(railroad)
  puts 'Input the title of station'
  input = gets.chomp
  railroad.new_station(input)
  railroad.list_of_stations
end

def add_train(railroad)
  puts 'Select type of new train:'
  puts '0 - Passenger train'
  puts '1 - Cargo train'
  puts 'any other - cancel'
  input = gets.chomp.to_i
  case input
  when 0
    railroad.new_p_train
  when 1
    railroad.new_c_train
  else
    puts 'Canceled'
  end
end

def add_carriage(railroad)
  list_of_trains(railroad)
  puts 'Enter a number of train to add a carriage'
  input = gets.chomp.to_i
  railroad.add_car_to(input)
end

def unhook_carriage(railroad)
  list_of_trains(railroad)
  puts 'Enter a number of train to add a carriage'
  input = gets.chomp.to_i
  railroad.delete_car_from(input)
end

def new_route(railroad)
  railroad.list_of_stations
  puts 'Enter a number of the start station:'
  start_number = gets.chomp.to_i
  puts 'Enter a number of the finish station:'
  end_number = gets.chomp.to_i
  railroad.new_route(start_number, end_number)
end

def route_to_train(railroad)
  railroad.list_of_all_trains
  puts 'Enter a number of train:'
  number_of_train = gets.chomp.to_i
  railroad.routes
  puts 'Enter a number of route:'
  number_of_route = gets.chomp.to_i
  railroad.set_route(number_of_train, number_of_route)
end

def add_station_in_route(railroad, route_number)
  railroad.list_of_stations
  puts 'Enter number of station to add into route:'
  station_number = gets.chomp.to_i
  puts railroad.route(route_number).to_s
  puts 'Enter number of position:'
  position_number = gets.chomp.to_i
  railroad.add_in_route(route_number, station_number, position_number)
end

def delete_station_from_route(railroad, route_number)
  railroad.route(route_number)
  puts 'Enter number of station:'
  station_number = gets.chomp.to_i
  railroad.delete_from_route(route_number, station_number)
end

def change_route(railroad)
  railroad.routes
  puts 'Enter a number of route:'
  number_of_route = gets.chomp.to_i
  railroad.route(number_of_route)
  puts 'What to do with route: 0 - add station in route, 1 - delete station, 2 - cancel'
  action = gets.chomp.to_i
  case action
  when 0
    add_station_in_route(railroad, number_of_route)
  when 1
    delete_station_from_route(railroad, number_of_route)
  when 2
    puts 'Canceled'
  end
end

def move_train(railroad)
  railroad.list_of_all_trains
  puts 'Enter a number of train to move:'
  number_of_train = gets.chomp.to_i
  puts "Train number #{number_of_train}, on station #{railroad.current_station(number_of_train)}"
  puts 'Select action: 0 - next station, 1 - previous station, 2 - cancel'
  action = gets.chomp.to_i
  case action
  when 0
    railroad.go_next(number_of_train)
  when 1
    railroad.go_prev(number_of_train)
  when 2
    puts 'Canceled'
  end
end

rzhd = Railway.new

loop do
  begin
    show_menu
    input = gets.chomp.to_i
    case input
    when 0
      puts '--- List of stations --------------'
      list_of_stations(rzhd)
    when 1
      puts '--- All trains on railroad --------'
      list_of_trains(rzhd)
    when 2
      puts '--- List of trains on station -----'
      trains_on_station(rzhd)
    when 3
      puts '--- Move train --------------------'
      move_train(rzhd)
    when 4
      puts '--- Add a station on railroad -----'
      add_station(rzhd)
    when 5
      puts '--- Add a train to railroad -------'
      add_train(rzhd)
    when 6
      puts '--- Add a route on railroad -------'
      new_route(rzhd)
    when 7
      puts '--- Set route to train ------------'
      route_to_train(rzhd)
    when 8
      puts '--- Change route ------------------'
      change_route(rzhd)
    when 9
      puts '--- Add a carriage to train -------'
      add_carriage(rzhd)
    when 10
      puts '--- Unhook a carriage from train --'
      unhook_carriage(rzhd)
    end
  end
end
