# introducing lambda

def setup
  size 200, 200
  # load the pixels array
  load_pixels
  background 0
  # loop through the pixels and set each one to a random greyscale color
  col = ->{color(rand 255)}
  pixels.size.times { |i| pixels[i] = col.call }
  # update the pixels on screen
  update_pixels
end



