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
DIRECTIONS = %q(NESW)
COORD_MOVES = [[0, 1], [1, 0], [0, -1], [-1, 0]]


  def initialize(x, y, d, path, map)
    @x, @y, @d, @path, @map = x, y, d, path, map
  end
  
  def run
    puts "robot's start location x = #{@x} and y = #{@y} turn to #{@d}"
    path = @path.split("")
    path.each do |move|
      step(move)
    end
    puts "robot's end location x = #{@x} and y = #{@y} turn to #{@d}"
  end
  
  def step(move)
    direct(COORD_MOVES[DIRECTIONS.index(@d)]) if move == "M"
    @d = DIRECTIONS[(DIRECTIONS.index(@d) + 1 + 4) % 4].chr if move == "R"
    @d = DIRECTIONS[(DIRECTIONS.index(@d) - 1 + 4) % 4].chr if move == "L"
  end
  
  def direct(array)
    @x = @x + array[0] if @map.validX?(@x + array[0])
    @y = @y + array[1] if @map.validY?(@y + array[1])
  end
end



$stdout = File.open('output.txt', 'w')
$stderr = File.open('errors.txt', 'a')
while ! ARGF.eof?
  arr = ARGF.readline.chomp.split(";")
  x = arr[0]
  y = arr[1]
  d = arr[2]
  arr = ARGF.readline.chomp.split(";")
  map = CratorMap.new(arr[0].to_i, arr[1].to_i)
  arr = ARGF.readline.chomp
  path = arr
  robot = Robot.new(x.to_i, y.to_i, d, path, map)
  robot.run
end




