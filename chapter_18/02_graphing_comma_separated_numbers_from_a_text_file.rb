#
# Example 18-2: Graphing comma separated numbers from a text file
#
def setup
  size 200, 200
  # The text from the file is loaded into an array. 
  stuff = File.readlines("#{sketch_path}/data/data-1.txt")

  # This array has one element because the file only has one line. 
  # Convert String into an array of integers using ',' as a delimiter
  @data = stuff.first.split(',')
  @data.map! {|num| num.to_i }
end

def draw
  background 255
  stroke 0
  @data.each_with_index do |data, i|
    # The array of ints is used to set the color and height of each rectangle.
    fill data
    # counter intuitive y values owing to processings poxy coordinate convention
    rect i * 20, height - data, 20, height 
  end
end
