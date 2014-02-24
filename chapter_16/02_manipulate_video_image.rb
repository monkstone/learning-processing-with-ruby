# Step 1. Import the video library
load_library :video
# We need the video classes to be included here.
include_package "processing.video" 

def setup
  size 320, 240   
  @video = Capture.new(self, width, height, 30)
end

def draw
  @video.read if @video.available
  
  # Tinting using mouse location
  tint mouse_x, mouse_y, 255
  
  # A video image can also be tinted and resized just as with a PImage.
  image @video, 0, 0, mouse_x, mouse_y
end


