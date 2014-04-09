
def setup
  size 400, 400
  smooth 4
  # Create two balls, one with the default radius.
  @ball_1, @ball_2 = Ball.new(radius: 64), Ball.new
end

def draw
  background 255
  @ball_1.move
  @ball_2.move
  
  # New! Methods on objects that you define can take each other as arguments.
  # This is one way to have objects communicate.
  # In this case they're checking to see if they intersect.
  if @ball_1.intersect(@ball_2)
    @ball_1.highlight
    @ball_2.highlight
  end
  
  @ball_1.display
  @ball_2.display
end



class Ball
  include Processing::Proxy
  # We use attr_reader to make the @x, @y and @r instance variables readable by other objects.
  attr_reader :x, :y, :r, :width, :height, :x_speed, :y_speed
  
  def initialize(radius: 32) # a hash parameter for constructor
    @width, @height = $app.width, $app.height
    @r = radius
    @x, @y = rand(r .. width - r), rand(r .. height - r)
    @x_speed, @y_speed = rand(-5.0 .. 5), rand(-5.0 .. 5)
    @color = color(100, 50)
  end
  
  def move
    @x += x_speed # Move the ball horizontally
    @y += y_speed # Move the ball vertically
    # boundary check
    @x_speed *= -1 unless (r .. width - r).include?(@x)
    @y_speed *= -1 unless (r .. height - r).include?(@y)
  end
  
  def highlight
    @color = color(0, 150)
  end
  
  def display
    stroke 0
    fill @color
    ellipse @x, @y, @r*2, @r*2
    # After the ball is displayed, the color is reset back to a dark gray.
    @color = color(100, 50)
  end
  
  # A function that returns true or false based on whether or not two circles intersect.
  # If distance is less than the sum of the radii, the circles touch.
  # Objects that you define can be passed as arguments too!
  def intersect(other_ball)
    distance = dist(@x, @y, other_ball.x, other_ball.y)
    distance < @r + other_ball.r
  end
end

