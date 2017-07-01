class Station
  def initialize(name)
    @name = name
    @list_of_trains = {}
  end

  def get_train(train)
    @list_of_trains[train.number] = train.type
  end

  def list_of_trains()
    @list_of_trains.size
  end

  def get_list_of_trains_by_type(type)
    @list_of_trains
  end

  def send_train(train)
    @list_of_trains.delete(train.number)
  end
end

class Route
  def initialize(from, to)
    @stations = [from, to]
  end

  def add_station(station)
  end

  def delete_station(station)
  end
end

class Train
  def initialize(number, type, count_of_cars)
    @number = number
    @type = type
    @count_of_cars = count_of_cars
  end

  def route(route)
    @route = route
  end
end
