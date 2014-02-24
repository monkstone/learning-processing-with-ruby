
class BouncingBallSketch < Processing::App
  def setup
    smooth 4
    
    # Create two balls.
    @ball_1, @ball_2 = Ball.new(64), Ball.new(32)
  end
  
  def draw
    background 255
    @ball_1.move
    @ball_2.move
    @ball_1.display
    @ball_2.display
  end
end


class Ball
  include Processing::Proxy
  attr_reader :width, :height
  
  def initialize(temp_r)
    @width, @height = $app.width, $app.height
    @r = temp_r
    @x, @y = rand(width), rand(height)
    @x_speed, @y_speed = rand(-5.0 .. 5), rand(-5.0 .. 5)
  end
  
  def move
    @x += @x_speed # Move the ball horizontally
    @y += @y_speed # Move the ball vertically
    
    # Check for the edges of the sketch
    @x_speed *= -1 unless (0..width).include?(@x)
    @y_speed *= -1 unless (0..height).include?(@y)
  end
  
  def display
    stroke 0
    fill 0, 50
    ellipse @x, @y, @r*2, @r*2
  end
end

BouncingBallSketch.new :title => "Bouncing Ball", :width => 400, :height => 400