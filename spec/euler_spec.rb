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
    subject.euler3.should == 1  # replace with correct value
  end
end