class ArrayDiagonalRotator

  def create_output_array(input_array)
    height = input_array.size
    width = input_array.first.size
    num_output_inner_arrays = height + width - 1
    Array.new(num_output_inner_arrays)
  end

  def rotate(input_array)
    a = input_array
    [a.last.first]
  end
end