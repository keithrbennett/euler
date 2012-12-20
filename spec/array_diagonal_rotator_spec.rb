require "rspec"
require "array_rotator"


describe ArrayRotator do

  # The number of arrays required will be (height + width - 1) of original array.
  it "should create an array of x + y - 1 arrays" do
    rotator = ArrayRotator.new([[0, 1, 2], [3, 4, 5]])
    output_array = rotator.send(:create_output_array)
    output_array.length.should == 4
  end

  it "should generate the same array when rotated 180 twice" do
    a0 = [[1,2,3], [4,5,6], [7,8,9]]
    a1 = ArrayRotator.rotate(a0, 180)
    a2 = ArrayRotator.rotate(a1, 180)
    a2.should == a0
  end

  it "should generate the same array when rotated 90 4x" do
    original = [[1,2,3], [4,5,6], [7,8,9]]
    calculated = original
    4.times { calculated = ArrayRotator.rotate(calculated, 90) }
    calculated.should == original
  end

  it "should return the array unchanged for 0 degree rotation" do
    original = [[1,2,3], [4,5,6], [7,8,9]]
    ArrayRotator.rotate(original, 0).should == original
  end

  it "should rotate 180 correctly" do
    original = [[1,2,3], [4,5,6], [7,8,9]]
    expected = [[9,8,7], [6,5,4], [3,2,1]]
    ArrayRotator.rotate(original, 180).should == expected
  end

  it "should rotate 270 correctly" do
    original = [[1,2,3], [4,5,6]]
    expected = [[3,6], [2,5], [1,4]]
    ArrayRotator.rotate(original, 270).should == expected
  end

  it "should rotate 90 correctly" do
    original = [[1,2,3], [4,5,6]]
    expected = [[4,1], [5,2], [6,3]]
    ArrayRotator.rotate(original, 90).should == expected
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
    original = [[0, 1, 2], [3, 4, 5]]
    expected = [[2], [1,5], [0,4], [3]]
    ArrayRotator.rotate(original, 45).should == expected
  end

  it "should calculate line segments of 1 orientation of a 2d array correctly" do
    a = [[0,1,2], [3,4,5], [6,7,8]]
    expected = [[0, 1], [1, 2], [3, 4], [4, 5], [6, 7], [7, 8]]
    actual = ArrayRotator.line_segments_from_array_2d(a, 2)
    actual.should == expected
  end

  it "should calculate line segments of 1 orientation of a 2d array correctly" do
    a = [[0,1,2], [3,4,5], [6,7,8]]
    expected = [[0, 1], [1, 2], [3, 4], [4, 5], [6, 7], [7, 8]]
    actual = ArrayRotator.line_segments_from_array_2d(a, 2)
    actual.should == expected
  end

  it "should calculate line segments of a 2d array correctly" do
    a = [[0,1,2], [3,4,5], [6,7,8]]
    expected = [[0,3], [3,6], [1,4], [4,7], [2,5], [5,8],
        [0,1], [1,2], [3,4], [4,5], [6,7], [7,8],
        [3,7], [0,4], [4,8], [1,5],
        [1,3], [2,4], [4,6], [5,7]
    ].sort
    actual = ArrayRotator.horizontal_vertical_and_diagonal_line_segments(a, 2)
    # For comparison, sort all arrays, do from innermost level out:
    actual.each { |a1| a1.sort! }
    actual.sort!
    actual.should == expected.sort
  end
end