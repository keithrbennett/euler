require 'pry'
require 'math_utilities'
class Euler

  include MathUtilities

  def euler1
    nums_to_sum = (0...1000).select { |n| n % 3 == 0 || n % 5 == 0 }
    nums_to_sum.inject(:+)
  end

  def euler2
    fibonacci_sequence(4_000_000).inject do |sum, n|
      (sum = sum + n) if n.even?
      sum
    end
  end


  def euler3
    answer = prime_factors(600851475143).last
    p answer
  end

end
