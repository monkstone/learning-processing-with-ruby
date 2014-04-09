# Introducing the Processing::Proxy module
# Here we mixin this module, to provide access to sketch methods/variables 
# within the Car class (similar to vanilla processings inner class access)
# except width and height variables are deliberately excluded

# require 'car'


def setup
  size 200, 200
  # Initialize a car object
  @my_car = Car.new
  rect_mode CENTER
end

def draw
  background 255
  
  # Operate the car object in draw
  # by calling object methods using the dots syntax.
  @my_car.move
  @my_car.display_car
end
    



# Define a class below the rest of the program.
# Or in another file eg car.rb then use require 'car' to include in the sketch
# 
# 'include Processing::Proxy' makes methods and variables available
# to the Car (similar to processings java inner class) except that
# width and height are excluded, hence global $app is reqd to access them

class Car 
  include Processing::Proxy
  
  attr_reader :width, :height
  
  def initialize
    @width, @height = $app.width, $app.height
    @c = color 175
    @xpos = width / 2
    @ypos = height / 2
    @xspeed = 1
  end

  def display_car # A new function of class Car
    stroke 0
    fill @c
    rect @xpos, @ypos, 20, 10
  end

  def move
    @xpos = @xpos + @xspeed
    @xpos = 0 if @xpos > width
  end
end


