

def setup
  size 200, 200
  rect_mode CENTER
end

def draw
  background 255
  stroke 0
  fill 175

  # translate to center
  translate width/2, height/2
  # The greek letter "theta" is often used as the name of a variable to store an angle
  # The angle ranges from 0 to PI, based on the ratio of mouse_x location to the sketch's width.
  theta = PI * mouse_x / width 

  rotate theta
  rect 0, 0, 100, 100
end



