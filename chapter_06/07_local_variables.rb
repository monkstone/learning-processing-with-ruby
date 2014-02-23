# To fix this add 'attr_reader :ted'
# and use '@' sigil prefix version of ted to assign

# attr_reader :ted

def setup
  size 200, 200
  ted = 2000
  no_loop
end

def draw
  background 0 
  # x is not available! Since it is declared within the setup
  begin
    puts "in draw:\n#{ted.inspect}"
  rescue => detail
    puts "in draw:\nrescue"
  end
end

def mouse_pressed
  # x is not available! It is local to the setup block of code.
  begin
    puts "in mouse_pressed:\n#{ted.inspect}"
  rescue => detail
    puts "in mouse_pressed:\nrescue"
  end
end

