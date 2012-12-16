class PrimeGenerator

  include Enumerable

  attr_reader :upper_bound

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
    (! bounded?) || n <= upper_bound
  end
  private :within_bound

  def prime?(n)
    @primes.none? { |prime| n % prime == 0 }
  end
  private :prime?


end