class CratorMap

  def initialize(x, y)
    @x, @y = x, y
  end
  
  def validX?(x)
    (x < @x) && (x >= 0)
  end
  
  def validY?(y)
    (y < @y) && (y >= 0)
  end
end

class Robot
DIRECTIONS = ["N", "E", "S", "W"]
COORD_MOVES = [[0, 1], [1, 0], [0, -1], [-1, 0]]


  def initialize(x, y, d, path, map)
    @x, @y, @path, @map = x, y, path, map
    @d = DIRECTIONS.index(d)
    @counter = 0
  end
  
  def run
    puts "START"
    puts "step - #{@counter} robot's location x = #{@x} and y = #{@y} turn to #{DIRECTIONS[@d]}"
    path = @path.split("")
    path.each do |move|
      step(move)
      @counter = @counter + 1
      puts "step - #{@counter} robot's location x = #{@x} and y = #{@y} turn to #{DIRECTIONS[@d]} "
      
    end
    puts "step - #{@counter+1} robot's location x = #{@x} and y = #{@y} turn to #{DIRECTIONS[@d]}"
    puts "FINISH"
  end
  
  def step(move)
    direct(COORD_MOVES[@d]) if move == "M"
    @d = (@d + 1 + 4) % 4 if move == "R"
    @d = (@d - 1 + 4) % 4 if move == "L"
  end
  
  def direct(array)
    @x = @x + array[0] if @map.validX?(@x + array[0])
    @y = @y + array[1] if @map.validY?(@y + array[1])
  end
end



$stdout = File.open('output.txt', 'w')
$stderr = File.open('errors.txt', 'a')

ARGV.each do |b|
    puts "\nFile - #{b}"
    file = File.open(b)
    while !file.eof?
      robot_data = file.gets.chomp.split(";")
      x = robot_data[0]
      y = robot_data[1]
      d = robot_data[2]
      map_data = file.gets.chomp.split(";")
      map = CratorMap.new(map_data[0].to_i, map_data[1].to_i)
      path = file.gets.chomp
      robot = Robot.new(x.to_i, y.to_i, d, path, map)
      robot.run
    end
end




