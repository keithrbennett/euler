require "rspec"
require "array_diagonal_rotator"


describe ArrayDiagonalRotator do

  # The number of arrays required will be (height + width - 1) of original array.
  it "should create an array of x + y - 1 arrays" do
    input_array = Array.new(4) { Array.new(3) }
    output_array = subject.send(:create_output_array, input_array)
    output_array.length.should == 6
  end
end