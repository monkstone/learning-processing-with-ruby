
def setup
  size 200, 200, P3D
  @cellsize = 2
  @img = load_image 'sunflower.jpg' # Load the image
  @img.load_pixels
  @pixels = @img.pixels
  @cols = width / @cellsize         # Calculate number of columns
  @rows = height / @cellsize        # Calculate number of rows    
  no_stroke
  rect_mode CENTER
end

def draw
  background 255
  @cols.times do |i|                      # Begin loop for columns
    x = i * @cellsize + @cellsize / 2     # x position
    @rows.times do |j|                    # Begin loop for rows
      y = j * @cellsize + @cellsize / 2   # y position
      loc = x + y * width                 # Pixel array location
      c = @pixels[loc]                    # Grab the color

      # Calculate a z position as a function of mouse_x and pixel brightness
      z = (mouse_x/width.to_f) * brightness(@pixels[loc]) - 100.0

      # Translate to the location, set fill and stroke, and draw the rect
      push_matrix
      translate x, y, z
      fill c
      rect 0, 0, @cellsize, @cellsize
      pop_matrix
    end
  end
end



