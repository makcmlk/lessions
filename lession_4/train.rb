class Train
  attr_accessor :number
  def initialize(number)
    @number = number
    @cars = []
    @count_of_cars = count_of_cars
    @speed = 0
  end

  def route(new_route)
    puts "route of #{@number} is changed"
    @route = new_route
    @station_number = 0
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

  def count_of_cars
    @cars.size
  end

  def delete_car
    @cars.last.delete
  end

  protected

  # вызывается из классов-наследников
  def add_car(new_car)
    @cars.insert(new_car)
  end

  private

# не используем этот метод
  def current_station
    return @route.station(@station_number).name unless @route.nil?
  end

  # не используем этот метод
  def next_station
    if !@route.nil?
      return 'On the last station!' unless @station_number + 1 == @route.size
      @route.station(@station_number + 1).name
    else
      'no route!'
    end
  end

  # не используем этот метод
  def prev_station
    if !@route.nil?
      return puts 'On the first station!' unless @station_number.nonzero?
      @route.station(@station_number - 1).name
    else
      puts 'no route!'
    end
  end

  # не используем этот метод
  def speed
    puts "speed of train is #{@speed}"
  end

  # этот метод описывает внутреннее поведение объекта
  def up_speed
    puts 'Up speed! too! too!'
    @speed += 60
  end

  # этот метод описывает внутреннее поведение объекта
  def stop
    puts 'Train is stoped'
    @speed = 0
  end
end
