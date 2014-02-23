attr_reader :r, :g, :b, :a, :x, :y, :diam

def setup
  size 200, 200
  @r, @g, @b, @a = 100, 150, 200, 200
  @x, @y = 100, 100
  @diam = 50
  
  background 255
  smooth 4
end

def draw
  # Use the variables to draw an ellipse
  stroke 0
  fill r, g, b, a # Remember, the fourth argument for a color means opacity.
  ellipse x, y, diam, diam
end


