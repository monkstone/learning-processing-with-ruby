

def setup
  size 200, 200
  @img = load_image 'sunflower.jpg'
end

def draw
  # Draw the image
  image @img, 0, 0
  # Filter the window with a threshold effect
  # 0.5 means threshold is 50% brightness
  filter THRESHOLD, 0.5
end


