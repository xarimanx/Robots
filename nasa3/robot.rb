class Robot
DIRECTIONS = ["N", "E", "S", "W"]
COORD_MOVES = [[0, 1], [1, 0], [0, -1], [-1, 0]]


  def initialize(x, y, d, map)
    @x, @y, @map = x, y, map
    @d = DIRECTIONS.index(d)
    @counter = 0
  end
  
  def where_you?
    puts "step - #{@counter} robot's location x = #{@x} and y = #{@y} turn to #{DIRECTIONS[@d]}"
  end
  
  def move(step)    
    direct(COORD_MOVES[@d]) if step == "M"
    @d = (@d + 1 + 4) % 4 if step == "R"
    @d = (@d - 1 + 4) % 4 if step == "L"
    @counter = @counter + 1
  end
  
  def direct(array)
    @x = @x + array[0] if @map.validX?(@x + array[0])
    @y = @y + array[1] if @map.validY?(@y + array[1])
  end
end