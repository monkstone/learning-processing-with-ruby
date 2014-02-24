class Zoog
  include Processing::Proxy
  attr_accessor :width, :height
  attr_accessor :temp_x_position, :temp_y_position, :temp_width, :temp_height, :temp_eye_size
  
  def initialize(temp_x_position, temp_y_position, temp_zoog_width, temp_zoog_height, temp_eye_size)
    @width, @height = $app.width, $app.height
    @x, @y = temp_x_position, temp_y_position
    @w, @h = temp_zoog_width, temp_zoog_height
    @eye_size = temp_eye_size
  end
  
  # Move zoog
  def jiggle(speed)
    @x = @x + speed * rand(-1.0 .. 1)
    @y = @y + speed * rand(-1.0 .. 1)
    
    @x = constrain(@x, 0, width)
    @y = constrain(@y, 0, height)
  end
  
  def display
    # Draw zoog's arms
    (@y - @h/3).step((@y + @h/2), 10) do |i|
    stroke 0
    line @x-@w/4, i, @x+@w/4, i
    end
    
    # Draw zoog's body
    stroke 0
    fill 255
    rect @x, @y, @w/6, @h
    
    # Draw zoog's head
    stroke 0
    fill 255
    ellipse @x, @y-@h, @w, @h
    
    # Draw zoog's eyes
    fill 0
    ellipse @x-@w/3, @y-@h, @eye_size, @eye_size*2
    ellipse @x+@w/3, @y-@h, @eye_size, @eye_size*2
    
    # Draw zoog's legs
    stroke 0
    line @x-@w/12, @y+@h/2, @x-@w/4, @y+@h/2+10
    line @x+@w/12, @y+@h/2, @x+@w/4, @y+@h/2+10
  end
  
end  

