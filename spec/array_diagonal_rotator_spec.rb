require "rspec"
require "array_diagonal_rotator"


describe ArrayDiagonalRotator do

  subject { ArrayDiagonalRotator.new([[0, 1], [2, 3]]) }

  # The number of arrays required will be (height + width - 1) of original array.
  it "should create an array of x + y - 1 arrays" do
    input_array = Array.new(4) { Array.new(3) }
    output_array = subject.send(:create_output_array)
    output_array.length.should == 3
  end

  it "'s first array should be [1] " do
    pending
    subject.rotate_45_left.first.should == [1]
  end

  it "'s second array should be [0, 3]" do
    pending
    subject.rotate_45_left[1].should == [2, 1]
  end

  it "'s third array should be [1]" do
    pending
    subject.rotate_45_left[2].should == [3]
  end

end