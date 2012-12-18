class ArrayRotator

  attr_reader :data_array, :num_output_inner_arrays

  def initialize(data_2d_array)
    @data_array = data_2d_array
  end

  def y_size
    data_array.size
  end

  def x_size
    data_array.first.size
  end

  def y_max
    y_size - 1
  end

  def x_max
    x_size - 1
  end

  def num_output_inner_arrays
    y_size + x_size - 1
  end

  def create_output_array
    Array.new(num_output_inner_arrays)
  end


  def value_at(yx)
    y, x = yx
    @data_array[y][x]
  end

  def upper_right_to_lower_left_coords
    points = []
    x_max.downto(0) { |x| points << [0, x] }
    1.upto(y_max)   { |y| points << [y, 0]}
    points
  end

  def inner_line_coords(start_xy)
    y, x = start_xy
    coords = []
    while y <= y_max
      coords << [y, x]
      y += 1
      x += 1
    end
    coords
  end

  # Input array must be a 2D array whose inner arrays
  # sizes are all equal
  def rotate_45_left_new_array
    new_array = []  # output array
    upper_right_to_lower_left_coords.each do |start_yx|
      inner_array = []
      inner_line_coords.each do |yx|
        inner_array << value_at(start_yx)
      end
      new_array << inner_array
    end
    new_array
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

  def ==(other)
    data_array == other.data_array
  end
end