# Here we introduce a slightly more sophisticated version of a Ruby-Processing
# sketch. The code inside of the setup is run a single time, at the beginning.
# Note: parentheses are mostly optional, add them if you think it makes your code clearer
def setup
  size 200, 200
  smooth 4
  background 255
  # In Ruby, methods and variables are under_scored instead of camelCased
  no_fill
  stroke 0
  ellipse 60, 60, 100, 100
end

# And the code inside of draw, if there were any, would be drawn over and over.
def draw
 
end
