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