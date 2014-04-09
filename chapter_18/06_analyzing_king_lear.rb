#
# Example 18-6: Analyzing King Lear
#
require 'open-uri'

def setup
  size 200, 200

  # Load the font
  text_font(load_font("#{sketch_path}/data/Georgia-Bold-16.vlw"))

  # Where are we in the text (start later b/c Project Gutenberg has 
  # licensing info at beginning)
  @counter = 0 #1509

  # Load King Lear into an array of strings  
  url     = 'http://www.gutenberg.org/ebooks/1128.txt'
  everything = open(url) {|f| f.read }

  # Join the big array together as one long string
  puts everything

  # All the lines in King Lear are first joined as one big String and 
  # then split up into an array of individual words. 
  # Note the use of split() since we are using spaces and 
  # punctuation marks all as delimiters.  
  delimiters = /[ ,.?!;:\[\]]/
  @kinglear  = everything.split(delimiters)

  frame_rate 5
end

def draw
  background 255

  # Pick one word from King Lear
  theword = @kinglear[@counter].chomp 

  # Count how many times that word appears in King Lear
  
  total = @kinglear.select{|word| theword == word}.length unless theword == ' '

  # Display the text and total times the word appears
  fill 0
  text theword, 10, 90
  text "#{total}", 10, 110
  stroke 0
  fill 175
  rect 10, 50, total / 4, 20

  # Move onto the next word
  @counter = (@counter + 1) % @kinglear.length
end
