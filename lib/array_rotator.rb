class ArrayRotator

  attr_reader :data_array, :num_output_inner_arrays

  def initialize(data_2d_array)
    @data_array = data_2d_array
    @y_size = data_array.size
    @x_size = data_array.first.size
    @y_max = @y_size - 1
    @x_max = @x_size - 1
    @num_output_inner_arrays = @y_size + @x_size - 1
  end

  def create_output_array
    Array.new(@num_output_inner_arrays)
  end


  def value_at(yx)
    y, x = yx
    @data_array[y][x]
  end

  def upper_right_to_lower_left_as_array
    points = []
    @x_max.downto(0) { |x| points << [0, x] }
    1.upto(@y_max)   { |y| points << [y, 0]}
    points
  end

  # Input array must be a 2D array whose inner arrays
  # sizes are all equal
  def rotate_45_left
    input_array = @data_array
    new_array = []  # output array
    upper_right_to_lower_left_as_array.each do |start_yx|
      inner_array = []
      inner_array = value_at(start_yx)
        new_array

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
      new_array << inner_array
    end
    @data_array = new_array
  end

  def rotate_180
    @data_array.reverse!.each { |inner_array| inner_array.reverse! }
  end

  def rotate_90_right
    @data_array = @data_array.transpose.reverse
  end

  def rotate_90_left
    @data_array = @data_array.reverse.transpose
  end

end