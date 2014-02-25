#
# Example 18-3: Creating objects from a text file
#
def setup
  size 200, 200
  smooth

  # Load text file as an array of Strings
  data = File.readlines("#{sketch_path}/data/data-2.txt")

  # The size of the array of Bubble objects is determined by the 
  # total number of lines in the text file.
  @bubbles = []
  data.each do |datum|
    # Each line is split into an array of floating point numbers.
    values = datum.split(',').map {|d| d.to_f }
    # The values in the array are passed into the Bubble class constructor.
    @bubbles << Bubble.new(*values)
  end
end

def draw
  background 255
  # Display and move all bubbles
  @bubbles.each do |bubble|
    bubble.display
    bubble.drift
  end
end

#
# A Class to describe a "Bubble"
#
class Bubble
  include Processing::Proxy
  
  attr_reader :width, :height
  # The constructor initializes color and size
  # Location is filled randomly
  def initialize(r, g, diameter)
    @width, @height = $app.width, $app.height
    @x, @y    = rand(width), height
    @r, @g    = r, g
    @diameter = diameter
  end

  # Display the Bubble
  def display
    stroke 0
    fill @r, @g, 255, 150
    ellipse @x, @y, @diameter, @diameter
  end

  # Move the bubble
  def drift
    @y += rand(-3 .. -0.1)
    @x += rand(-1 .. 1.0)
    @y = height + @diameter * 2 if @y < -@diameter * 2
  end
end
