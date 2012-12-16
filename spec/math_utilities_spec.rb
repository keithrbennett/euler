require 'rspec'
require 'math_utilities'

describe MathUtilities do

  subject do
    utils = Object.new
    utils.extend(MathUtilities)
    utils
  end

  it "should know that 4 is a multiple of 2 but 5 is not" do
    subject.multiple_of?(4,2).should be_true
    subject.multiple_of?(5,2).should be_false
  end

  it "should calculate fibonacci correctly" do
    # from Wikipedia:
    expected = %w(0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765).map(&:to_i)
    subject.fibonacci_sequence(6765).should == expected
  end

  it "should handle the fibonacci's upper bound correctly" do
    subject.fibonacci_sequence(10).last.should == 8
  end

  it "should create a digit array correctly" do
    subject.digit_array_from_string('7502834').should == [7, 5, 0, 2, 8, 3, 4]
  end

end