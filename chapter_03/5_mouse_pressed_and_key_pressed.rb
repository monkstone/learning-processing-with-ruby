
# Click the mouse to draw a square. Hit the space bar to clear the window.

def setup
  size 200, 200	  
  background 255
  stroke 0
  fill 175
  rect_mode CENTER
end

def draw
  # empty draw loop
end

# Whenever the mouse is clicked, the code inside mouse_pressed runs.
def mouse_pressed
  rect mouse_x, mouse_y, 16, 16
end

# Whenever a key is pressed, the code inside key_pressed runs.
def key_pressed
  background 255
end


