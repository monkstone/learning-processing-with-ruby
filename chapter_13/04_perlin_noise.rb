
def setup
  size 200, 200
  smooth 4
  @time = 0.0
  @increment = 0.01
end

def draw
  background 255

  n = noise(@time) * width
  @time += @increment
  fill 0
  ellipse width / 2, height / 2, n, n
end

