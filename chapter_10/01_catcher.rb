
def setup
  size 400, 400
  @catcher = Catcher.new(32)
  smooth 4
end

def draw  
  background 255
  @catcher.set_location 
  @catcher.display
end



class Catcher
  include Processing::Proxy
  
  def initialize(temp_r)
    @r = temp_r
    @x, @y = 0, 0
  end
  
  def set_location
    @x, @y = mouse_x, mouse_y
  end
  
  def display
    stroke 0
    fill 175
    ellipse @x, @y, @r*2, @r*2
  end
end

