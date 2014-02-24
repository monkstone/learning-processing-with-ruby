
# A Rotater class
class Rotater
  include Processing::Proxy
  
  attr_reader :speed, :theta
  
  def initialize(x, y, speed, width)
    @x, @y = x, y
    # Angle is always initialized to 0
    @theta = 0 
    @speed = speed
    @w = width
  end

  # Increment angle
  def spin
    @theta += speed
  end

  # Display rectangle
  def display
    # push_matrix and pop_matrix are called inside the class' display method. 
    # This way, every Rotater object is rendered with its own independent translation and rotation!
    push_matrix  
    translate @x, @y
    rotate theta
    rect 0, 0, @w, @w
    pop_matrix 
  end

end



def setup
  size 200, 200
  rect_mode CENTER
  stroke 0
  fill 0, 100
  @rotaters = Array.new(20) do
    Rotater.new(rand(width), rand(height), rand(-0.1 .. 0.1), rand(48))
  end
end

def draw
  background 255

  # All Rotaters spin and are displayed
  @rotaters.each do |r|
    r.spin
    r.display
  end
end



