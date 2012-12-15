require 'pry'

class Euler

  def euler1
    nums_to_sum = (0...1000).select { |n| n % 3 == 0 || n % 5 == 0 }
    nums_to_sum.inject(:+)
  end

  def fibonacci_sequence(upper_bound)
    fibs = [0, 1]
    until fibs[-1] >= upper_bound
      fibs << fibs[-1] + fibs[-2]
    end
    fibs
  end

  def euler2
    fibonacci_sequence(4_000_000).inject do |sum, n|
      (sum = sum + n) if n.even?
      sum
    end
  end


  def mult_of?(n, factor)
    n % factor == 0
  end

  def prime_numbers(upper_bound)
    return [] if upper_bound < 2
    primes = [2]
    3.upto(upper_bound) do |n|
      is_prime = primes.none? { |prime| mult_of?(n, prime) }
      primes << n if is_prime
    end
    return primes
  end


  def prime_factors(n)
    factors = []
    primes = prime_numbers(n / 2)
    primes.each do |prime|
      while mult_of?(n, prime)
        factors << prime
        n = n / prime
      end
    end
    factors
  end

  def euler3
    answer = prime_factors(600851475143).last
    p answer
  end

end
