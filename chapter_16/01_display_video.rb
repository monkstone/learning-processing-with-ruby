

# Step 1. Import the video library
load_library :video
# We need the video classes to be included here.
include_package "processing.video" 

def setup
  size 320, 240
  # Step 2. Declare a Capture object
  @video = Capture.new(self, width, height, 30)
end

def draw
  # Step 3 and 4: Read from the camera if it's available.
  @video.read if @video.available

  # Step 5. Display the video image.
  image @video, 0, 0
end


