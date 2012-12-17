require "rspec"
require "array_rotator"


describe ArrayRotator do

  subject { ArrayRotator.new([[0, 1], [2, 3]]) }

  # The number of arrays required will be (height + width - 1) of original array.
  it "should create an array of x + y - 1 arrays" do
    input_array = Array.new(4) { Array.new(3) }
    output_array = subject.send(:create_output_array)
    output_array.length.should == 3
  end

  it "should generate the same array when rotated 180 twice" do
    a = [[1,2,3], [4,5,6], [7,8,9]]
    rotator = ArrayRotator.new(a)
    2.times { rotator.rotate_180 }
    rotator.data_array.should == a
  end

  it "should generate the same array when rotated 90 4x" do
    a = [[1,2,3], [4,5,6], [7,8,9]]
    rotator = ArrayRotator.new(a)
    4.times { rotator.rotate_90_right }
    rotator.data_array.should == a
  end

  it "should rotate 180 correctly" do
    original = [[1,2,3], [4,5,6], [7,8,9]]
    expected = [[9,8,7], [6,5,4], [3,2,1]]
    rotator = ArrayRotator.new(original)
    rotator.rotate_180
    rotator.data_array.should == expected
  end

  it "should rotate right 90 correctly" do
    original = [[1,2,3], [4,5,6]]
    expected = [[3,6], [2,5], [1,4]]
    rotator = ArrayRotator.new(original)
    rotator.rotate_90_right
    rotator.data_array.should == expected
  end

  it "should rotate left 90 correctly" do
    original = [[1,2,3], [4,5,6]]
    expected = [[4,1], [5,2], [6,3]]
    rotator = ArrayRotator.new(original)
    rotator.rotate_90_left
    rotator.data_array.should == expected
  end

  it "should calculate upper_right_to_lower_left_as_array correctly" do
    a = [[1,2,3], [4,5,6]]
    rotator = ArrayRotator.new(a)
    expected = [[0,2], [0,1], [0,0], [1,0]]
    rotator.upper_right_to_lower_left_coords.should == expected
  end

  it "should calculate inner line coordinates correctly for rotate_45_left" do
    a = [[1,2,3], [4,5,6]]
    rotator = ArrayRotator.new(a)
    start_xy = [0,1]
    expected = [[0,1], [1,2]]
    rotator.inner_line_coords(start_xy).should == expected
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