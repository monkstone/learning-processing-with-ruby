def setup
  size 200, 200
end

def draw
  # Try moving background to setup and see the difference!
  background 255
  
  # Body
  stroke 0
  fill 175
  rect_mode CENTER
  
  # mouse_x is a keyword that the sketch replaces with the 
  # horizontal position of the mouse.
  # mouse_y gets the vertical position.
  rect mouse_x, mouse_y, 50, 50
end

