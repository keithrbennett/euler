class ArrayDiagonalRotator

  def create_output_array(input_array)
    height = input_array.size
    width = input_array.first.size
    num_output_inner_arrays = height + width - 1
    Array.new(num_output_inner_arrays)
  end

  def rotate(input_array)
    ia = input_array
    oa = []  # output array
    oa << [ia[-1][0]]
    oa << [ia[-2][0], ia[-1][1]]
    oa << [ia[0][-1]]
    oa
  end
end