

def setup
  size 200, 200, P3D
  @z = 0  # A variable for the z (depth) coordinate
  rect_mode CENTER
end

def draw
  background 255
  stroke 0
  fill 175
  
  # Translate to a point before displaying a shape there
  translate width/2, height/2, @z
  rect 0, 0, 8, 8

  # Increment z (i.e. move the shape toward the viewer)
  @z += 1

  # Start rectangle over
  @z = 0 if @z > 200 
end



