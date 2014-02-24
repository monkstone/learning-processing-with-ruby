

def setup
  size 200, 200, P3D
  smooth 4
  rect_mode CENTER
end

def draw
  background 255
  stroke 0
  fill 175

  translate width/2, height/2
  rotate_x PI * (height - mouse_y) / height
  rotate_y PI * mouse_x / width
  rect 0, 0, 100, 100
end



