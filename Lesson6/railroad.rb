require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'station'
require_relative 'route'
require_relative 'wagon'

class RailRoad

  attr_reader :stations, :trains, :routs, :wagons

  def initialize
    @stations = []
    @trains = []
    @routs = []
    @wagons = []
  end

  def make_station(name)
    @stations << Station.new(name)
    true
  rescue RuntimeError => e
    puts e.message
    false
  end

  def make_wagon(type)
    case type
    when :cargo
      @wagons << CargoWagon.new
      true
    when :passenger
      @wagons << PassengerWagon.new
      true
    else
      puts "Undefined wagon type!"
      false
    end
  rescue RuntimeError => e
    puts e.message
    false
  end

  def make_train(number, type)
    case type
      when :cargo
        @trains << CargoTrain.new(number)
        true
      when :passenger
        @trains << PassengerTrain.new(number)
        true
      else
        puts "Undefined train type!"
        false
    end
  rescue RuntimeError => e
    puts e.message
    false
  end

  def make_route(start,finish)
    @routs << Route.new(start,finish)
  end

  def print_stations
    if @stations.size != 0
      @stations.each.with_index(1){|station, index| puts "Станция №#{index} - '#{station.name}'"}
    else
      print "No stations!"
    end
  end

  def print_routs
    if @routs.size != 0
     @routs.each.with_index(1) do |route, index|
        print "Маршрут №#{index}: "
        route.print_in_line
      end
    else
      print "No routs!"
    end
  end

  def print_wagons
    @wagons.each.with_index(1) do |wagon, index|
      print "Вагон №#{index} - "
      wagon.info
    end
  end

  def print_trains
    @trains.each.with_index(1) do |train, index|
      print "\n №#{index} - "
      train.info_full
    end
  end

end
