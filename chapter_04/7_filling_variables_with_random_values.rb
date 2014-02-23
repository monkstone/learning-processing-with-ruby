def setup
  size 200, 200
  background 255
  smooth 4
end

def draw
  # Each time through draw, new random numbers 
  # are picked for a new ellipse.
  # We're using local variables here, not instance variables,
  # because we only need them in the draw method.
  r, g, b, a = rand(255), rand(255), rand(255), rand(255)
  diam = rand(20)
  x, y = rand(width), rand(height)
  
  # Use the values to draw an ellipse
  no_stroke
  fill r, g, b, a
  ellipse x, y, diam, diam
end


