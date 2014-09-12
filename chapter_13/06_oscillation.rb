# Get to grips with ruby lambda, then write more functional code when it makes sense

def setup
  size 200, 200
  # The output of the sin() function oscillates smoothly between -1 and 1. 
  # By adding 1 we get values between 0 and 2. 
  # By multiplying by width / 2, we get values between 0 and width,
  # that can be used as the ellipse's x location.
  
  @sine = ->(angle){(sin(angle) + 1) * width / 2}
  fill 0
  stroke 0
end

def draw
  background 255
  x = @sine.call(frame_count * 0.05)
  # draw the ellipse at the value produce by the sin
  line width / 2, 0, x, height / 2
  ellipse x, height / 2, 16, 16
end
