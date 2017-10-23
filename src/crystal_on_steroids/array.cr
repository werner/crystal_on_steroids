class Array(T)
  # Returns the second element in an array.
  #
  # ```
  # [1, 2, 3, 4, 5].second
  # => [2]
  # ```
  def second
    self[1]
  end

  # Returns the third element in an array.
  #
  # ```
  # [1, 2, 3, 4, 5].second
  # => [3]
  # ```
  def third
    self[2]
  end

  # Returns the fourth element in an array.
  #
  # ```
  # [1, 2, 3, 4, 5].second
  # => [4]
  # ```
  def fourth
    self[3]
  end

  # Returns the fifth element in an array.
  #
  # ```
  # [1, 2, 3, 4, 5].second
  # => [5]
  # ```
  def fifth
    self[4]
  end

  # Returns the elements in an array except the first one.
  #
  # ```
  # [1, 2, 3, 4, 5].rest
  # => [2, 3, 4, 5]
  # ```
  def rest
    arr = dup
    arr - [arr.first]
  end

  # Returns the tail of the array from +position+.
  #
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
  def from(position : Int)
    if size == 0
      [] of T
    elsif position > size || position < -(size)
      [] of T
    else
      self[position, size]
    end
  end

  # Returns the beginning of the array up to +position+.
  #
  #   %w( a b c d ).to(0)
  # => ["a"]
  #
  #   %w( a b c d ).to(2)
  # => ["a", "b", "c"]
  #
  #   %w( a b c d ).to(10)
  # => ["a", "b", "c", "d"]
  #
  #   %w().to(0)
  # => []
  #
  #   %w( a b c d ).to(-2)
  # => ["a", "b", "c"]
  #
  #   %w( a b c ).to(-10)
  # => []
  #
  def to(position : Int)
    self[0..position]
  end

  # Divides the array into one or more subarrays based on a delimiting +value+
  # or the result of an optional block.
  #
  # ```
  # [1, 2, 3, 4, 5].split(3)
  # => [[1, 2], [4, 5]]
  # ```
  def split(value = nil)
    arr = dup
    result = [] of typeof(arr)
    while (idx = arr.index(value))
      response = arr.shift(idx)
      result.push(response)
      arr.shift
    end
    result << arr
  end

  # Divides the array into one or more subarrays based on a
  # the result of an optional block.
  #
  # ```
  # (1..10).to_a.split { |i| i % 3 == 0 }
  # => [[1, 2], [4, 5], [7, 8], [10]]
  # ```
  def split
    arr = dup
    result = [] of typeof(arr)
    while (idx = arr.index { |i| yield i })
      result << arr.shift(idx)
      arr.shift
    end
    result << arr
  end
end
