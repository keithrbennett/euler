require 'math_utilities'

# An optionally lazy sequence of prime numbers.
# Using the each method lazily initializes;
class Primes

  # Writes the primes sequence to a file; must be bounded.
  def write_file(filespec, upper_bound)
    verify_unbounded(upper_bound)
    primes = PrimeGenerator.new(upper_bound)
    File.open(filespec, 'w') do |file|
      primes.each { |prime| file << prime.to_s + "\n" }
    end
  end

  # Returns an array of the primes sequence to a file; must be bounded.
  def as_array(upper_bound)
    verify_unbounded(upper_bound)
    PrimeGenerator.new(upper_bound).to_a
  end


  def prime_factors(n)
      factors = []
      PrimeGenerator.new(n / 2).each do |prime|
        while n % prime == 0
        #while MathUtilities.multiple_of?(n, prime)
          factors << prime
          n = n / prime
        end
      end
      factors
    end


  def verify_unbounded(upper_bound)
    if upper_bound == nil
      raise "Without an upper bound, this method will never return."
    end
  end

end
