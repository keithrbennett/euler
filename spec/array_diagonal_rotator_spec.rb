require "rspec"
require "array_diagonal_rotator"


describe ArrayDiagonalRotator do

  # The number of arrays required will be (height + width - 1) of original array.
  it "should create an array of x + y - 1 arrays" do
    input_array = Array.new(4) { Array.new(3) }
    output_array = subject.send(:create_output_array, input_array)
    output_array.length.should == 6
  end

  it "'s first array should have 1 element whose content is x_0, y_max " do
    a = [[0, 1], [2, 3]]
    subject.rotate(a).first.should == [2]
  end

  it "'s second array should be [0, 3]" do
    a = [[0, 1], [2, 3]]
    subject.rotate(a)[1].should == [0, 3]
  end

  it "'s third array should be [1]" do
    a = [[0, 1], [2, 3]]
    subject.rotate(a)[2].should == [1]
  end

end