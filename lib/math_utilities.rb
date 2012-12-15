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

  def prime_numbers(upper_bound)
    return [] if upper_bound < 2
    primes = [2]
    3.upto(upper_bound) do |n|
      is_prime = primes.none? { |prime| mult_of?(n, prime) }
      if is_prime
        primes << n
      end
    end
    primes
  end


  def prime_factors(n)
    want_logging = n > 1000 * 1000
    factors = []
    primes = prime_numbers(n / 2)
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