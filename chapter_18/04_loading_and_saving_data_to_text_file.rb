#
# Example 18-4: Loading and saving data to text file
#
def setup
  size 200, 200
  smooth
  @file_path = "#{sketch_path}/data/data-2.txt"

  # Load text file as an array of Strings
  data = File.readlines(@file_path)

  # The size of the array of Bubble objects is determined by the 
  # total number of lines in the text file.
  @bubbles = []
  data.each do |datum|
    # Each line is split into an array of floating point numbers.
    values = datum.split(',').map {|num| num.to_f }
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

    # Change bubbles if mouse rolls over
    bubble.change if bubble.rollover(mouse_x, mouse_y)
  end
end

# Save new Bubble data when mouse is pressed
def mouse_pressed
  save_data
end

def save_data
  # For each Bubble make one String to be saved
  data = []

  @bubbles.each do |bubble|
    # Concatenate bubble variables
    data << "#{bubble.r}, #{bubble.g}, #{bubble.diameter}"
  end

  # Save to File
  # The same file is overwritten by adding the data folder path to saveStrings().
  File.open(@file_path, 'w') {|file| file.write(data.join("\n")) }
end

#
# A Class to describe a "Bubble"
#
class Bubble
  include Processing::Proxy
  
  attr_reader :width, :height, :r, :g, :diameter

  # The constructor initializes color and size
  # Location is filled randomly
  def initialize(r, g, diameter)
    @width, @height = $app.width, $app.height
    @x        = random(width)
    @y        = height
    @r        = r
    @g        = g
    @diameter = diameter
  end

  # True or False if point is inside circle
  def rollover(mx, my)
    dist(mx, my, @x, @y) < diameter / 2
  end

  # Change Bubble variables
  def change
    @r        = constrain(@r + rand(-10 .. 10), 0, 255)
    @g        = constrain(@g + rand(-10 .. 10), 0, 255)
    @diameter = constrain(@diameter + rand(-2 .. 4), 4, 72)
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
    if @y < -@diameter * 2
      @y = height + @diameter * 2 
    end
  end
end
