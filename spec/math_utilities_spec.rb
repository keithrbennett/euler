require 'rspec'
require 'math_utilities'

describe MathUtilities do

  subject do
    utils = Object.new
    utils.extend(MathUtilities)
    utils
  end

  it "should know that 4 is a multiple of 2 but 5 is not" do
    subject.mult_of?(4,2).should be_true
    subject.mult_of?(5,2).should be_false
  end

  it "should get prime numbers of [2, 3, 5, 7, 11, 13, 17, 19] w/max 20" do
    expected =  [2, 3, 5, 7, 11, 13, 17, 19]
    subject.prime_numbers(20).should == expected
  end

  it "should calculate fibonacci correctly" do
    # from Wikipedia:
    expected = %w(0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765).map(&:to_i)
    subject.fibonacci_sequence(6765).should == expected
  end

  it "should handle the fibonacci's upper bound correctly" do
    subject.fibonacci_sequence(10).last.should == 8
  end

  it "should calculate prime factors of 88 as 2, 2, 2, 11" do
    expected = [2, 2, 2, 11]
    factors = subject.prime_factors(88)
    factors.should == expected
  end

  it "should create a digit array correctly" do
    subject.digit_array_from_string('7502834').should == [7, 5, 0, 2, 8, 3, 4]
  end

end