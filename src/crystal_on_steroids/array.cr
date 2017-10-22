class Array(T)
  macro define_order(name, number)
    def {{name.id}}
      @size > {{number}} ? @buffer[{{number}}] : raise IndexError.new
    end
  end

  define_order :second, 1
  define_order :third,  2
  define_order :fourth, 3
  define_order :fifth,  4

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
