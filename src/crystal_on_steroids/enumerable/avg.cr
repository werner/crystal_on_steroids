module Enumerable(T)
  # Returns the average of a collection of numbers.
  #
  # ```
  # [1, 2, 3, 4, 5].avg
  # => 3
  # ```
  def avg
    self.sum / self.size
  end
end
