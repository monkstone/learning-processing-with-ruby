# For some reason this sketch needs to be run using --nojava flag

def setup
  size 200, 200
  # the image file must be in the data directory
  @img = load_image("mysummervacation.jpg")
end

def draw
  background 0
  #The image function displays the image at a location-in this case the point (0,0).
  image @img, 0, 0
end



