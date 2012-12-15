require "rspec"
require 'primes'
require 'fakefs'

describe Primes do

  it "should correctly detect the first prime > 10000" do
    subject.detect { |prime| prime > 10000 }.should == 10007
  end

  it "should correctly return the first 10 primes" do
    primes = []
    10.times { primes << subject.next_prime }
    primes.should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end

  it "should correctly write primes to a file" do
    FakeFS do
      filespec = 'primes.txt'
      Primes.write_file(filespec, 30)
      expected = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      File.readlines(filespec).map { |line| line.strip.to_i }.should == expected
    end
  end

  it "should handle upper bound of primes correctly" do
    Primes.as_array(20).should == [2, 3, 5, 7, 11, 13, 17, 19]
  end

  it "should handle upper bound of nil for primes correctly" do
    -> { Primes.as_array(nil) }.should raise_error
  end


end