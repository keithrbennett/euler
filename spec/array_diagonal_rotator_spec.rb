require "rspec"
require "array_rotator"


describe ArrayRotator do

  subject { ArrayRotator.new([[0, 1, 2], [3, 4, 5]]) }

  # The number of arrays required will be (height + width - 1) of original array.
  it "should create an array of x + y - 1 arrays" do
    output_array = subject.send(:create_output_array)
    output_array.length.should == 4
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

  it "should return the same result for 1 180 as 2 90's" do
    original = [[1,2,3], [4,5,6], [7,8,9]]
    expected = [[9,8,7], [6,5,4], [3,2,1]]
    rotator_90_right  = ArrayRotator.new(original)
    rotator_90_left  = ArrayRotator.new(original)
    rotator_180 = ArrayRotator.new(original)
    2.times { rotator_90_right.rotate_90_right }
    2.times { rotator_90_left.rotate_90_left }
    1.times { rotator_180.rotate_180 }
    rotator_90_left.should == rotator_180 \
    &&
    rotator_90_right.should == rotator_180
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
    start_yx = [0,2]
    expected = [[0,2]]
    rotator.inner_line_coords(start_yx).should == expected
  end

  it "should calculate a left rotate 45 correctly" do
    expected = [[2], [1,5], [0,4], [3]]
    subject.rotate_45_left_new_array.should == expected
  end


end