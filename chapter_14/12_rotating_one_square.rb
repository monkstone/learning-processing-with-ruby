

def setup
  size 200, 200, P3D
  rect_mode CENTER
  @theta1 = 0
end

def draw
  background 255
  stroke 0
  fill 175

  translate 50, 50
  rotate_z @theta1
  rect 0, 0, 60, 60
  @theta1 += 0.02
end



