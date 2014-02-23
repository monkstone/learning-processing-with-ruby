# This sketch introduces the fuller version of a Ruby-Processing sketch,
# and demonstrates what's really going on behind the scenes when you make
# one of the simpler sketches, with just a setup method.


def setup
  size 200, 200	  
  background 0 
  no_stroke
  
  # No fourth argument means 100% opacity
  fill 0, 0, 255
  rect 0, 0, 100, 200
  
  # 255 means 100% opacity
  fill 255, 0, 0, 255
  rect 0, 0, 200, 40
  
  # 75% opacity
  fill 255, 0, 0, 191
  rect 0, 50, 200, 40
  
  # 55% opacity
  fill 200, 0, 0, 127
  rect 0, 100, 200, 40
  
  # 25% opacity
  fill 255, 0, 0, 63
  rect 0, 150, 200, 40
end

def draw

end
  

