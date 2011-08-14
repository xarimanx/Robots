class Operator
  
  def initialize(path, robot)
    @path, @robot = path, robot
  end
  
  def work
    puts "START"    
    path = @path.split("")
    @robot.where_you?
    path.each do |step|
      @robot.move(step)  
      @robot.where_you?
    end
    puts "FINISH"
  end
end