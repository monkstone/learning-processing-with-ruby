
# NEW FEATURE #1: Zoog will rise from below the screen and fly off into space.
# NEW FEATURE #2: Zoog's eyes will be colored randomly as Zoog moves.

def setup
  size 200, 200	  
  @zoog_x, @zoog_y = width / 2, height + 100
  smooth 4
end

def draw
  background 255 # Draw a white background
  
  # Set ellipses and rects to CENTER mode
  ellipse_mode CENTER
  rect_mode CENTER
  
  # Draw Zoog's body
  stroke 0
  fill 150
  # Feature #1: zoog_x and zoog_y are used for the location
  rect @zoog_x, @zoog_y, 20, 100
  
  # Draw Zoog's head
  stroke 0
  fill 255
  ellipse @zoog_x, @zoog_y - 30, 60, 60
  
  # Draw Zoog's eyes
  # Feature #2: Zoog's eyes are colored with random values.
  fill rand(255), rand(255), rand(255)
  ellipse @zoog_x - 19, @zoog_y - 30, 16, 32
  ellipse @zoog_x + 19, @zoog_y - 30, 16, 32
  
  # Draw Zoog's legs
  stroke 150
  line @zoog_x - 10, @zoog_y + 50, @zoog_x - 10, height
  line @zoog_x + 10, @zoog_y + 50, @zoog_x + 10, height
  
  # Zoog moves up
  @zoog_y -= 1
  
end


