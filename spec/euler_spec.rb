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
    answer = subject.euler3
    STDERR.puts "problem 3 answer is #{answer}"
    answer.should == 1  # replace with correct value
  end

  it "should calculate euler8 correctly" do
    # Found max: num = 40824, offset = 364, digits = [9, 9, 8, 7, 9]
    subject.euler8.should == 40824
  end

  it "should calculate euler13 correctly" do
    subject.euler13.should == '5537376230'
  end

  it "should exercise problem 11" do
    ->{subject.euler11 }.should_not raise_error
  end

  it "should exercise problem 19" do
    ->{subject.euler19 }.should_not raise_error
  end

end