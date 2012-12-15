require 'rspec'
require 'euler'


describe Euler do


  it "should calculate the sum correctly" do
    sum = 0
    (0..999).each do |n|
      if (n % 3 == 0) || (n % 5) == 0
        sum += n
      end
    end
    subject.euler1.should == sum   # 233168
  end


  it "should calculate fibonacci correctly" do
    # from Wikipedia:
    expected = %w(0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765).map(&:to_i)
    subject.fibonacci_sequence(6765).should == expected
  end

  it "should calculate euler2 correctly" do
    subject.euler2.should == 4613732
  end

  it "should calculate prime factors of 88 as 2, 2, 2, 11" do
    expected = [2, 2, 2, 11]
    factors = subject.prime_factors(88)
    factors.should == expected
  end

  it "should know that 4 is a multiple of 2 but 5 is not" do
    subject.mult_of?(4,2).should be_true
    subject.mult_of?(5,2).should be_false
  end

  it "should get prime numbers of [2, 3, 5, 7, 11, 13, 17, 19] w/max 20" do
    expected =  [2, 3, 5, 7, 11, 13, 17, 19]
    subject.prime_numbers(20).should == expected
  end

  it "should calculate euler3 correctly" do
    answer = subject.euler
    pending
    subject.euler3.should == 1  # replace with correct value
  end
end