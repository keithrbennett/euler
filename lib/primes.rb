# An optionally lazy sequence of prime numbers.
# Using the each method lazily initializes;
class Primes

  include Enumerable

  attr_reader :upper_bound

  # Writes the primes sequence to a file; must be bounded.
  def self.write_file(filespec, upper_bound)
    verify_unbounded(upper_bound)
    primes = Primes.new(upper_bound)
    File.open(filespec, 'w') do |file|
      primes.each { |prime| file << prime.to_s + "\n" }
    end
  end

  # Returns an array of the primes sequence to a file; must be bounded.
  def self.as_array(upper_bound)
    verify_unbounded(upper_bound)
    Primes.new(upper_bound).to_a
  end

  def self.verify_unbounded(upper_bound)
    if upper_bound == nil
      raise "Without an upper bound, this method will never return."
    end
  end

  def initialize(upper_bound = nil)
    @upper_bound = upper_bound
    @primes = []
  end

  def bounded?
    !! upper_bound
  end

  def each
    while (prime = next_prime)
      yield(prime)
    end
  end

  def next_prime
    if @primes.empty?
      next_prime = 2
    else
      n = @primes.last + 1
      until prime?(n)
        n += 1
      end
      next_prime = n
    end

    if within_bound(next_prime)
      @primes << next_prime
    else
      next_prime = nil
    end

    next_prime
  end

  def within_bound(n)
    (! bounded) || n <= upper_bound
  end
  private :within_bound

  def prime?(n)
    @primes.none? { |prime| n % prime == 0 }
  end
  private :prime?

end
