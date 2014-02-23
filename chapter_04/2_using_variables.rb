# Note since processing-2.0 the bare sketch is preferred, however at runtime
# this code will be wrapped in a "Sketch" class 

def setup
  # Create two variables, holding integers.
  # These will be instance variables, meaning that you can
  # get at them from any method within the 'Sketch class'.
  # object variables in Ruby begin with '@' sigil.
  size 200, 200 
  @circle_x = 100
  @circle_y = 100
  smooth 4
end

def draw
  background 255
  stroke 0
  fill 175
  # We use the object (instance) variables from setup for the circle.
  # They are available in this method too.
  ellipse @circle_x, @circle_y, 50, 50
end

# However with ruby you should explore attr_reader, and attr_accessor which 
# allow the easy creation and use of getters and setters. Which can also be 
# be used within the class, and yes it also works in ruby-processing. 
# See following examples!
