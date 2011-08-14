require 'nasa3/crator_map'
require 'nasa3/robot'
require 'nasa3/operator'

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
      robot = Robot.new(x.to_i, y.to_i, d, map)
      path = file.gets.chomp
      operator = Operator.new(path, robot)
      operator.work
    end
end