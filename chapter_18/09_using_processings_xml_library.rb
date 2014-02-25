#
# Example 18-9: Using Processing's XML library
#


def setup
  size 200, 200
  smooth
  # Load an XML document
  xml = loadXML("bubbles.xml")

  # Getting the total number of Bubble objects with getChildCount().  
  totalBubbles = xml.get_child_count
  @bubbles = []

  # Get all the child elements
  children = xml.get_children("bubble")

  children.each do |child|
    diameterElement = child.get_child("diameter")
    diameter = diameterElement.get_content.to_i
    colorElement = child.get_child("color")
    r = colorElement.get_int("red")
    g = colorElement.get_int("green")

    # Make a new Bubble object with values from XML document
    @bubbles << Bubble.new(r, g, diameter)
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
# A Bubble class
#
class Bubble
  include Processing::Proxy
  attr_reader :width, :height
  
  def initialize(r, g, diameter)
    @width, @height = $app.width, $app.height
    @x = random(width)
    @y = height
    @r = r
    @g = g
    @diameter = diameter
  end

  # Display Bubble
  def display
    stroke 0
    fill @r, @g, 255, 150
    ellipse @x, @y, @diameter, @diameter
  end

  # Bubble drifts upwards
  def drift
    @y += rand(-3 .. -0.1)
    @x += rand(-1 .. 1.0)
    if @y < -@diameter * 2
      @y = height + @diameter * 2 
    end
  end
end
