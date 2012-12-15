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
    p subject.euler2.should == 4613732
  end

end