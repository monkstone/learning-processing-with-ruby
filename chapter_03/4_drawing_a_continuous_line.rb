
def setup
  size 200, 200	  
  background 255
  smooth 4
  stroke 0
end

def draw  
  # Draw a line from the previous mouse location to the current location.
  line pmouse_x, pmouse_y, mouse_x, mouse_y
end
  
