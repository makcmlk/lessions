class Train
  attr_accessor :number
  def initialize(number)
    @number = number
    @cars = []
    @count_of_cars = count_of_cars
    @speed = 0
  end

  def route(new_route)
    @route = new_route
    @station_number = 0
  end

  def move_next
    if !@route.nil?
      if @station_number == @route.size - 1
        puts ' in the end!'
      else
        puts " going to #{next_station}"
        @station_number += 1
        next_station
      end
    else
      puts 'no route!'
    end
  end

  def move_prev
    if !@route.nil?
      if @station_number < 1
        puts 'on the first station!'
      else
        puts " going to #{prev_station}"
        @station_number -= 1
        prev_station
      end
    else
      puts 'no route!'
    end
  end

  def count_of_cars
    @cars.size
  end

  def delete_car
    unless @cars.empty?
      @cars.last.delete
      puts "Car is deleted from #{this.number}"
    end
  end

  def current_station
    return @route.station(@station_number).name unless @route.nil?
  end

  def next_station
    if !@route.nil?
      if @station_number == @route.size - 1
        print ' on last station!'
      else
        @route.station(@station_number + 1)
      end
    else
      ' no route!'
    end
  end

  def prev_station
    if !@route.nil?
      if @station_number < 1
        puts 'On the last station!'
      else
        @route.station(@station_number - 1)
      end
    else
      'no route!'
    end
  end

  protected

  # вызывается из классов-наследников
  def add_car(new_car)
    @cars.push(new_car)
  end

private

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
