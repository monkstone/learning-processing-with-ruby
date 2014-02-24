

def setup
  size 200, 200
  @x = 1
  @speed = 1
  smooth
end

def draw
  background 255
  # Instead of writing out all the code about the ball 
  # in draw, we simply call three methods. How do 
  # we know the names of these methods? We made them up!
  move
  bounce
  display
end

# Where should methods be placed?
# You can define your methods anywhere in the code outside of setup and draw.
# However, the convention is to place your method definitions below draw.
# These methods all get wrapped in the Sketch class at runtime.

# A method to move the ball
def move
  # Change the x location by speed
  @x += @speed
end

# A method to bounce the ball
def bounce
  # If we’ve reached an edge, reverse speed
  # (0..width) is a Ruby range, representing the numbers from 0 to width (aka 200).
  # You can ask a range if it includes another number or not.
  @speed *= -1 unless (0..width).include? @x
end

# A method to display the ball
def display
  stroke 0
  fill 175
  ellipse @x, 100, 32, 32
end

