class ArrayDiagonalRotator

  attr_reader :input_array, :num_output_inner_arrays

  def initialize(input_array)
    @input_array = input_array
    @y_size = input_array.size
    @x_size = input_array.first.size
    @y_max = @y_size - 1
    @x_max = @x_size - 1
    @num_output_inner_arrays = @y_size + @x_size - 1
  end

  def create_output_array
    Array.new(@num_output_inner_arrays)
  end

  # Input array must be a 2D array whose inner arrays
  # sizes are all equal
  def rotate_45_left
    outer_output_array = []  # output array
    start_y, start_x = 0, @x_max
    outer_output_array << [input_array[start_y][start_x]]
    (0..@num_output_inner_arrays).each do |input_outer_array_index|
      #start y =
      inner_array = []


    end
    last_outer = ia.size - 1
    last_inner = ia.first.size - 1
    (last_outer.downto(0)).each do |outer_index|
      inner_array = []
      0.upto(last_inner) do |inner_index|
        inner_array << ia[inner_index][outer_index + inner_index]
      end
      outer_output_array << inner_array
    end
    outer_array
  end


end