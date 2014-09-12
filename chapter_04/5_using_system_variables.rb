
def setup
  size 200, 200
  smooth 4
end

def draw
  background 100
  stroke 255
  
  # frame_count is used to color a rectangle
  fill(frame_count / 2)
  rect_mode CENTER
  
  # The rectangle will always be in the middle of the window
  # if it is located at (width/2, height/2)
  rect(width / 2, height / 2, mouse_x + 10, mouse_y + 10)
end

def key_pressed
  puts "You pressed the '#{key}' key."
end


