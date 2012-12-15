module MathUtilities

  def fibonacci_sequence(upper_bound)
    fibs = [0, 1]
    until fibs[-1] >= upper_bound
      fibs << fibs[-1] + fibs[-2]
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
      primes << n if is_prime
    end
    primes
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

  def digit_array_from_string(string_of_digits)
    string_of_digits.scan(/./).map { |char| char.to_i }
  end
end