require 'pry'

class Primes

  include Enumerable

  def initialize
    @primes = []
  end

  def each
    while true
      yield(next_prime)
    end
  end

  def prime?(n)
    @primes.none? { |prime| n % prime == 0 }
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
    @primes << next_prime
    next_prime
  end

  def self.write_file(filespec, upper_bound)
    primes = Primes.new
    File.open(filespec, 'w') do |file|
      while (prime = primes.next_prime) <= upper_bound
        file << prime.to_s + "\n"
      end
    end
  end

end
