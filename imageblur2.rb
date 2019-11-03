class Image
  def initialize(pixels)
    @image = pixels
  end

  def find_ones
    ones = []
   @image.each_with_index do |row, x|
    row.each_with_index do |pixel, y|
      if pixel == 1 
        ones.push([x, y])
      end
    end
   end
   return ones
  end

  def output_image
   @image.each_with_index do |row, x|
    row.each_with_index do |pixel, y|
      print pixel
    end
    print "\n"
   end
  end

  def blur
    ones = find_ones
    ones.each do |coords|
      row = coords[0]
      col = coords[1]
      # blur up
      if row != 0
        @image[row+1][col] = 1
      end
      # blur right
      if col != @image[row].length - 1
        @image[row][col+1] = 1
      end
      # blur down
      if row != @image.length - 1
        @image[row-1][col] = 1
      end
      # blur left
      if col != 0
        @image[row][col-1] = 1
      end
    end
  end
end

image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
])
image.number_three(2)
image.output_image