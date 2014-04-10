# Many languages distinguish between functions, which have no associated object, 
# and methods, which are invoked on a receiver object. Strictly in ruby there are 
# no functions, they are either bound or unbound methods.
# all the below are bound methods (bound to an object of the Sketch class)

def setup
  size 100, 100
  smooth 4
end

def draw
  background 255
  draw_black_circle
end

def draw_black_circle
  fill 0
  ellipse 50, 50, 20, 20
end

