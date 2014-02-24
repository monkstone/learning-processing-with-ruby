attr_reader :drops, :max_drops

def setup
  size 400, 400 
  @max_drops = 1000         # The most drops we're going to have at once.
  @drops = []               # An array to hold the drops
  no_stroke
  smooth 4
end

def draw
  background 255
  drops << Drop.new        # Create one drop
  # Start over when we have too many.
  drops.clear if drops.size > max_drops
  
  # Move and display all the drops.
  # New! We no longer move and display all the drops, but rather,
  # only the ones that are still present in the @drops array.
  drops.each do |drop|
    drop.move
    drop.display
  end
end



class Drop
  include Processing::Proxy
  
  attr_reader :width, :height, :speed
  
  def initialize
    @width, @height = $app.width, $app.height
    @r = 8                    # All raindrops are the same size
    @x = rand(width)     # Start with a random x location
    @y = -@r * 4              # Start a little above the window
    @speed = rand(1 .. 4.0)
    # Pick a random speed
    @color = color(50, 100, 150)
  end
  
  # Move the raindrop down
  def move
    @y += speed              # Increment y by speed
  end
  
  # Check to see if it hit the bottom
  def reached_bottom?
    @y > height + @r*4   # If we go a little beyond the bottom
  end
  
  # Display the raindrop
  def display
    fill @color
    # For each number between 2 and the radius, draw an ellipse.
    (2...@r).each { |i| ellipse(@x, @y+i*4, i*2, i*2) }
  end
  
  # If the drop is caught
  def caught
    @speed = 0                # Stop it from moving by setting speed to 0
    @y = -1000                # Set the location way off the screen
  end
end

