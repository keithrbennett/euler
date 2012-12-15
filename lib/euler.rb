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
    evens = fibonacci_sequence(4_000_000).select { |n| n.even? }
    evens.inject(:+)
  end
end