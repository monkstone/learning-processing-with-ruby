

def setup
  size 200, 200
  background 0
  @x, @y = width / 2, 0
  smooth
  no_stroke
end

def draw
  background 255
  # Show the drop
  fill 50, 100, 150
  ellipse @x, @y, 16, 16
  # Move the drop
  @y += 1
end
