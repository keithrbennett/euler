require 'rspec'
require 'euler'


describe Euler do

  it "should calculate euler1 correctly" do
    sum = 0
    (0..999).each do |n|
      if (n % 3 == 0) || (n % 5) == 0
        sum += n
      end
    end
    subject.euler1.should == sum   # 233168
  end

  it "should calculate euler2 correctly" do
    subject.euler2.should == 4613732
  end

  it "should calculate euler3 correctly" do
    pending
    answer = subject.euler
    STDERR.puts "problem 3 answer is #{answer}"
    subject.euler3.should == 1  # replace with correct value
  end

  it "should calculate euler8 correctly" do
    # Found max: num = 40824, offset = 364, digits = [9, 9, 8, 7, 9]
    subject.euler8.should == 40824
  end

  it "should calculate euler13 correctly" do
    subject.euler13.should == '5537376230'
  end

  it "should create a digit array correctly" do
    expected = [7, 5, 0, 2, 8, 3, 4]
    subject.digit_array(7502834).should == expected
  end
end