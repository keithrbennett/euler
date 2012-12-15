require 'pry'

module MathUtilities

  def fibonacci_sequence(upper_bound)
    fibs = [0, 1]
    until (next_fib = (fibs[-1] + fibs[-2])) > upper_bound
      fibs << next_fib
    end
    fibs
  end

  def multiple_of?(n, factor)
    n % factor == 0
  end

  def prime_factors(n)
    factors = []
    Primes.new(n / 2).each do |prime|
      while multiple_of?(n, prime)
        factors << prime
        n = n / prime
      end
    end
    factors
  end

  def digit_array_from_string(string_of_digits)
    string_of_digits.scan(/./).map { |char| char.to_i }
  end
end