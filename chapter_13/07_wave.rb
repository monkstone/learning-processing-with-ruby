# demonstrate use of lamba and possibility of a more functional style
# of programming available to ruby users (cf vanilla processing)

def setup
  size 200, 200
  @sine = ->(angle, offset){sin(angle + offset) * height / 2}
  smooth 4
end

def draw
  background 255
  # Increment theta (try different values for " angular velocity " here)
   no_stroke
  fill 0
  # times is used to draw all the points along a sine wave (scaled to the pixel dimension of the window).
  20.times do |i|
    # Calculate y value based off of sine function
    
    # Draw an ellipse
    ellipse(i * 10, @sine.call(i * 0.2, frame_count * 0.02) + height/2, 16, 16)
  end
end
