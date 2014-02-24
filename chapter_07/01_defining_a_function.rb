# Strictly there are only bound and unbound methods in ruby
# "setup, draw and draw_black_circle" are all bound to a Sketch object

def setup
  size 200, 200
end

def draw

end

# This example defines a function, but it is
# not called.  So nothing happens.
def draw_black_circle
  fill 0
  ellipse 50, 50, 20, 20
end
