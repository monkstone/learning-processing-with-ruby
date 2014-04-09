# this sketch requires --nojruby flag (load_image)


def setup
  size 200, 200
  @pointillize = 10
  @img = load_image 'sunflower.jpg'
  background 255
  frame_rate 200 # Let's run this one as fast as we can.
  no_stroke
end

def draw
  # Pick a random point
  x, y = rand(width), rand(height)
  loc = x + y * width

  # Look up the RGB color in the source image
  load_pixels
  pixel = @img.pixels[loc]
  r, g, b = red(pixel), green(pixel), blue(pixel)
  
  # Draw an ellipse at that location with that color
  fill r, g, b, 100
  # Back to shapes! Instead of setting a pixel, we use the color from a pixel to draw a circle.
  ellipse x, y, @pointillize, @pointillize
end




