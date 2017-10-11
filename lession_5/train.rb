require_relative 'manufacturer'
require_relative 'instance_counter'

class Train

  include Manufacturer
  include InstanceCounter
  attr_accessor :number
  @trains = []

  class << self
    def new_train(train)
      @trains.push(train)
    end

    def find(number)
      result = @trains.select { |train| train.number == number }
      if !result.empty?
        return result
      else
        return nil
      end
    end
  end

  def initialize(number)
    @number = number
    @cars = []
    @count_of_cars = count_of_cars
    @speed = 0
    Train.new_train(self)
    register_instance
  end

  def route(new_route)
    @route = new_route
    @station_number = 0
  end

  def move_next
    if !@route.nil?
      if @station_number < @route.size
        @station_number += 1
        puts "Going to #{@route.station(@station_number).name}"
        @route.station(@station_number)
      end
    else
      puts 'no route!'
    end
  end

  def move_prev
    if !@route.nil?
      if @station_number >= 1
        @station_number -= 1
        puts "Going to #{@route.station(@station_number).name}"
        @route.station(@station_number)
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
      puts "Car is deleted from train No #{@number}"
      @cars.delete(@cars.last)
    end
  end

  def current_station
    return @route.station(@station_number) unless @route.nil?
  end

  def next_station
    if !@route.nil? && @station_number < @route.size - 1
      @route.station(@station_number + 1)
    else
      return nil
    end
  end

  def prev_station
    if !@route.nil? && @station_number > 0
      @route.station(@station_number - 1)
    else
      return nil
    end
  end

  def add_car(new_car)
    if valid_car?(new_car)
      @cars.push(new_car)
    end
  end

  protected

  # вызывается из классов-наследников
  def valid_car?(new_car)
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