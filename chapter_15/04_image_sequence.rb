# this sketch requires --nojruby flag (load_image)

def setup
  size 200, 200
  @index = 0
  @count = 7
  # loading the images into the array
  @images = (0...@count).map { |i| load_image("animal#{i}.jpg") }
  frame_rate 5
end

def draw
  # displaying one images
  image @images[@index], 0, 0 
  @index = (@index + 1) % @images.size
end



