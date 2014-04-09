
def setup
  size 400, 400
  smooth 4    
  # Create two balls, one with a default radius, one with a hash argument
  @ball_1, @ball_2 = Ball.new(radius: 64), Ball.new
end

def draw
  background 255
  @ball_1.move
  @ball_2.move
  @ball_1.display
  @ball_2.display
end



class Ball
  include Processing::Proxy
  attr_reader :width, :height, :r
  
  def initialize(radius: 32) # a hash argument with a default value
    @width, @height = $app.width, $app.height
    @r = radius
    @x, @y = rand(r .. width - r), rand(r .. height - r)
    @x_speed, @y_speed = rand(-5.0 .. 5), rand(-5.0 .. 5)
  end
  
  def move
    @x += @x_speed # Move the ball horizontally
    @y += @y_speed # Move the ball vertically
    
    # Check for the edges of the sketch
    @x_speed *= -1 unless (r ... width - r).include?(@x)
    @y_speed *= -1 unless (r ... height - r).include?(@y)
  end
  
  def display
    stroke 0
    fill 0, 50
    ellipse @x, @y, @r*2, @r*2
  end
end

