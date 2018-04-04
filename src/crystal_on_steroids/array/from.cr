class Array(T)
  # Returns the tail of the array from `position`.
  #
  # ```
  #   %w( a b c d ).from(0)
  # => ["a", "b", "c", "d"]
  #
  #   %w( a b c d ).from(2)
  # => ["c", "d"]
  #
  #   %w( a b c d ).from(10)
  # => []
  #
  #   %w().from(0)
  # => []
  #
  #   %w( a b c d ).from(-2)
  # => ["c", "d"]
  #
  #   %w( a b c ).from(-10)
  # => []
  # ```
  def from(position : Int)
    if size == 0
      [] of T
    elsif position > size || position < -(size)
      [] of T
    else
      self[position, size]
    end
  end
end
