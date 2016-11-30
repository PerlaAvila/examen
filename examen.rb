=begin
Clases
Crear una clase CreditCard que tenga como datos la información que aparece 
en la tabla de ejemplo. Posteriormente crea un arreglo con cinco objetos de 
tarjetas de crédito e imprime la información de cada tarjeta en una tabla. 
Utiliza las pruebas y la tabla que se presenta de ejemplo.
=end
#Clase CreditCard
require 'faker'
class CreditCard
  attr_reader :name, :number, :expiration, :cvc, :status
   
  def initialize(name, number, expiration, cvc, status)
    @name = name
    @number = number
    @expiration = number
    @cvc = cvc
    @status = status
  end
end
#Cinco instancias de CreditCard
   @cards = []
   @cards << CreditCard.new("Amex", 2345673444, 12/15, 2345, [234, 567, 456, 567, 344])
   @cards << CreditCard.new("ScotiaBank", 2345673744, 12/16, 2845, [234, 345, 456, 567, 344])
   @cards << CreditCard.new("Bancomer", 2345673444, 12/15, 2645, [234, 345, 456, 567, 344])
   @cards << CreditCard.new("Serfin", 2345473454, 12/20, 1345, [234, 345, 456, 567, 344])
   @cards << CreditCard.new("BanCoppel", 2345373464, 12/18, 2445, [567, 345, 456, 567, 344])

#Array con cinco objetos de tarjetas de crédito
  @cards

#tests 

@cards.each do |card|
   puts "#{card.name} responds to:"
   puts "\tName: #{card.respond_to?(:name) == true}"
   puts "\tNumber: #{card.respond_to?(:number) == true}"
   puts "\tExpiration: #{card.respond_to?(:expiration) == true}"
   puts "\tcvc: #{card.respond_to?(:cvc) == true}"
   puts "\tGet status: #{card.respond_to?(:status) == true}"
   puts "\tSet status: #{card.respond_to?(:status=) == true}"
   puts "\n\n"
end
  
  def show_card_data
      puts "|     name     |     number     |    expiration  |      cvc      |           status          |"
      puts "-" * 94
      @cards.each_with_index do |card, i|
      puts "|   #{card.name}       |    #{card.number}  |      #{card.expiration}     |      #{card.cvc}     | #{card.status} |"
      end
  end
  show_card_data










#EXCERCISE 2
=begin
Herencia
Crea las clases Athlete, Runner, Swimmer y Cyclist, trata de relacionarlas 
a través de herencia. Cada atleta podrá incrementar el total de la distancia 
recorrida y el tiempo total de ejercicio. Al final cada tipo de atleta deberá 
mostrar la distancia total recorrida, el tiempo total y la velocidad obtenida. 
Es importante considerar los casos cuando la distancia recorrida es igual a 0 y 
mayor que 0. Todas las pruebas deberán pasar.
=end
#Athlete class
class Athlete

  def initialize(distance= 0, time=0)
    @distance = distance
    @time = time
  end

  #método para validar tiempo
  def total_time

  end
  def total_time=(new_time)
    @time = new_time
  end
   
  def total_distance
  end

  def total_distance=(new_distance)
    @distance = new_distance
  end
  #método para hacer ejercicio
  def new_workout(distance_, time_)
    @distance_ = @distance += distance_
    @time_ = @time += time_
  end

  #método para obtener velocidad del atleta
  def speed
  end

  def speed_record
  end

end

#Runner class
class Runner < Athlete
  def run
     if @time > 0
    @speed = (@distance.to_f / @time.to_f).round(2)
      "Ran #{@distance} meters, time: #{@time} seconds, speed: #{@speed} m/s"
    else
      "Ran 0 meters, time: 0 seconds, speed: 0 m/s"
    end
  end
end

#Swimmer class
class Swimmer < Athlete
  def swim
    @speed = (@distance.to_f / @time.to_f).round(2)
    "Swam #{@distance} meters, time: #{@time} seconds, speed: #{@speed} m/s"
  end
end

#Cyclist class
class Cyclist < Athlete
  def ride_bike
  end
end

#tests

#instancias de atletas con distancia en metros
runner = Runner.new()
swimmer = Swimmer.new(50, 10)
cyclist = Cyclist.new(70, 27)

athletes = [runner, swimmer, cyclist]

athletes.each do |athlete|
  #¿qué tipo de atleta es?
  puts "#{athlete.class} responds to:"
  puts "\tAthlete speed: #{athlete.respond_to?(:speed) == true}"
  puts "\tGet Athlete time: #{athlete.respond_to?(:total_time) == true}"
  puts "\tSet Athlete time: #{athlete.respond_to?(:total_time=) == true}"
  puts "\tSpeed record: #{athlete.respond_to?(:speed_record) == true}"
  puts "\tGet Distance: #{athlete.respond_to?(:total_distance) == true}"
  puts "\tSet Distance: #{athlete.respond_to?(:total_distance=) == true}"
  puts "\trun method: #{athlete.respond_to?(:run) == true}" if athlete == runner
  puts "\tswim method: #{athlete.respond_to?(:swim) == true}" if athlete == swimmer
  puts "\tride_bike method: #{athlete.respond_to?(:ride_bike) == true}" if athlete == cyclist
  puts "\n\n"
end

#test for runner

#test para runner con distancia = 0
p runner.run == "Ran 0 meters, time: 0 seconds, speed: 0 m/s"
#test para runner al hacer ejercicio, incrementa distancia = 20 metros y tiempo = 7 segundos
runner.new_workout(20, 7) 
#test para runner con distancia = 20 metros y tiempo = 7 segundos
p runner.run == "Ran 20 meters, time: 7 seconds, speed: 2.86 m/s"

#test para swimmer con distancia = 50
p swimmer.swim == "Swam 50 meters, time: 10 seconds, speed: 5.0 m/s"

swimmer.new_workout(30, 12)

p swimmer.swim





#EXERCISE 3
=begin
Race cars
En una pista de carrera se realizan ciertas pruebas de velocidad a diferentes race cars.
Se necesita medir para cada carro la velocidad promedio de acuerdo a cinco laptimes 
registrados. El lapdistance de la pista es de 100 metros. Esta distancia es importante 
que la consideres constante en el programa.
Es necesario crear una clase RaceCar que contemple el nombre del carro y los tiempos de 
cada lap que ha registrado. Hay que considerar un método que retorne la velocidad 
promedio de cada carro, otro método que muestre el nivel de cada carro dependiendo de 
su velocidad (Principiante, Normal, Medio, Avanzado). Posteriormente, crear una clase 
Team que permita formar equipos de carros. Por último, crear un método que permita 
1buscar si existe un determinado carro en un equipo. Todas las pruebas deben pasar.
Extra - Crea un metodo en team que regrese el promedio de velocidad del equipo.
Extra - Genera una tabla que muestre el coche y su nivel.
=end
DISTANCE = 100
#RaceCar class
class RaceCar
  attr_accessor :car_name, :velocity
  def initialize(car_name, velocity)
    @car_name = car_name
    @velocity = velocity
  end

  #método para obtener velocidad promedio
  def average_speed
    @velocity.to_f / DISTANCE
  end

  #método que muestra nivel de cada race car
  def car_level
    level = ""
    case @velocity
      when 0..200 then level = "Beginner"
      when 201..400 then level = "Normal"
      when 401..600 then level = "Medium"
      when 601..800 then level = "Expert"
    end
  end
end

#Team class
class Team 
  attr_accessor :arr_cars
  def initialize(arr_cars)
    @arr_cars = arr_cars
  end

  #método para agregar nuevo race car
  def add_car(car, array)
    arr_cars = []
    array.each{|race_car| arr_cars << race_car }
    arr_cars
  end

  #método para calcular promedio de velocidad del equipo 
  def average_team_speed
    team_velocity = 0
    @arr_cars.each{ |car| team_velocity += car.velocity }
    "The average speed is: #{team_velocity / DISTANCE.to_f} m/s"
  end
end

#método para buscar race car
  def search(car, arr_cars)
    (arr_cars.arr_cars.find{|i| i.car_name == car }) ? "#{car} is a racer" : "#{car} is not a racer"
  end


#método para generar la tabla
def show_arr_cars(arr_cars)
  puts "Name\t - \tLevel\t"
  puts "-" * 25
  arr_cars.arr_cars.each do |car|
      puts"#{car.car_name} - \t#{car.car_level}"
  end
end

#instancias de RaceCar
car1 = RaceCar.new("Power", 250)
car2 = RaceCar.new("Chuchito", 130)
car3 = RaceCar.new("Clementina", 420)
car4 = RaceCar.new("Woliver", 550)
car5 = RaceCar.new("Perlita", 710)
car6 = RaceCar.new("Conchita", 1000)

#tests

p "car1: #{car1.average_speed} m/s"
#ej. car1: 9.5 m/s
p "car2: #{car2.average_speed} m/s"
#ej. car2: 12.01 m/s
p "car3: #{car3.average_speed} m/s"
#ej. car3: 10.65 m/s
p "car4: #{car4.average_speed} m/s"
#ej. car4: 11.0 m/s
p "car5: #{car5.average_speed} m/s"
#ej. car5: 10.15 m/s
p "car6: #{car6.average_speed} m/s"
#ej. car6: 15.51 m/s

#create a team of arr_cars 
team1 = [car1, car2, car3, car4, car5]
team_one = Team.new(team1)

#test para buscar race car en equipo team_one
p search("Power", team_one) #== "Power is a racer"

#calculate average speed of team
p team_one.average_team_speed
#ej. 10.66 

#método para mostrar nombre y nivel del race car
show_arr_cars(team_one)
