require "rspec"
require 'primes'
require 'fakefs'

describe Primes do

  it "should correctly write primes to a file" do
    FakeFS do
      filespec = 'primes.txt'
      subject.write_file(filespec, 30)
      expected = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      File.readlines(filespec).map { |line| line.strip.to_i }.should == expected
    end
  end

  it "should handle upper bound of primes correctly" do
    subject.as_array(20).should == [2, 3, 5, 7, 11, 13, 17, 19]
  end

  it "should handle upper bound of nil for primes correctly" do
    -> { subject.as_array(nil) }.should raise_error
  end

  it "should calculate prime factors of 88 as 2, 2, 2, 11" do
    expected = [2, 2, 2, 11]
    #n = 123456; puts "Prime Factors of #{n}:\n#{subject.prime_factors(n).to_a}"
    factors = subject.prime_factors(88)
    factors.should == expected
  end

  it "should get prime numbers of [2, 3, 5, 7, 11, 13, 17, 19] w/max 20" do
    expected =  [2, 3, 5, 7, 11, 13, 17, 19]
    subject.as_array(20).should == expected
  end

end