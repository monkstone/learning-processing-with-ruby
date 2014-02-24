

def setup
  size 200, 200
  rect_mode CENTER
  @r = 8
end

def draw
  size 200, 200
  background 255
  # Display a rectangle in the middle of the screen
  stroke 0
  fill 175
  rect width/2, height/2, @r, @r

  # Increase the rectangle size
  @r += 1

  # Start rectangle over
  @r = 0 if @r > width 
end


