require "rspec"
require 'prime_generator'

describe PrimeGenerator do

  it "should correctly detect the first prime > 10000" do
    subject.detect { |prime| prime > 10000 }.should == 10007
  end

  it "should correctly return the first 10 primes" do
    primes = []
    10.times { primes << subject.next_prime }
    primes.should == [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
  end

end