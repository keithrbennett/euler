class ArrayRotator

  attr_reader :data_array, :num_output_inner_arrays

  # data_2d_array must be a 2D array whose inner arrays
  # sizes are all equal.  Degrees should be one of
  # [0, 45, 90, 135, 180, 225, 270, 315].
  def self.rotate(data_2d_array, degrees)
    rotator = ArrayRotator.new(data_2d_array)
    case degrees
      when 0
        data_2d_array
      when 45
        rotator.rotate_45
      when 90
        rotator.rotate_90
      when 135
        a = rotator.rotate_180
        ArrayRotator.new(a).rotate_45
      when 180
        rotator.rotate_180
      when 225
        a = rotator.rotate_90
        ArrayRotator.new(a).rotate_45
      when 270
        a = rotator.rotate_180
        ArrayRotator.new(a).rotate_90
      when 315
        a = rotator.rotate_90
        ArrayRotator.new(a).rotate_45
      else
        legal_values = [0, 45, 90, 135, 180, 225, 270, 315]
        raise "Value of #{degrees} is not legal.  Legal values are #{legal_values.join(', ')}"
    end
  end

  def self.horizontal_vertical_and_diagonal_line_segments(array_2d, line_size)
    result = []
    [
        array_2d,
        ArrayRotator.rotate(array_2d, 45),
        ArrayRotator.rotate(array_2d, 270),
        ArrayRotator.rotate(array_2d, 135)
    ].each do |array|
      result += line_segments_from_array_2d(array, line_size)
    end
    result.sort
  end

  def self.line_segments_from_array_2d(array_2d, line_size)
    array_2d.inject([]) do |result_array, inner_array|
      result_array += inner_array.each_cons(line_size).to_a
    end
  end

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

  def inner_line_coords(start_yx)
    y, x = start_yx
    coords = []
    while y <= y_max && x <= x_max
      coords << [y, x]
      y += 1
      x += 1
    end
    coords
  end

  def rotate_180
    @data_array.reverse.each { |inner_array| inner_array.reverse! }
  end

  def rotate_90
    @data_array.reverse.transpose
  end

  def rotate_270
    @data_array.transpose.reverse
  end

  def rotate_45
    new_array = []  # output array
    upper_right_to_lower_left_coords.each do |start_yx|
      inner_array = []
      inner_line_coords(start_yx).each do |yx|
        inner_array << value_at(yx)
      end
      new_array << inner_array
    end
    new_array
  end

  def ==(other)
    data_array == other.data_array
  end
end