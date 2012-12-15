require 'pry'

module MathUtilities

  def fibonacci_sequence(upper_bound)
    fibs = [0, 1]
    until (next_fib = (fibs[-1] + fibs[-2])) > upper_bound
      fibs << next_fib
    end
    fibs
  end

  def mult_of?(n, factor)
    n % factor == 0
  end

  def prime_factors(n)
    want_logging = n > 1000 * 1000
    factors = []
    primes = Primes.as_array(n / 2)
    primes.each do |prime|
      while mult_of?(n, prime)
        factors << prime
        n = n / prime
        if want_logging; puts ("Factor: %8d  New n: %d" % [prime, new_n]); end
      end
    end
    factors
  end

  def digit_array_from_string(string_of_digits)
    string_of_digits.scan(/./).map { |char| char.to_i }
  end
end