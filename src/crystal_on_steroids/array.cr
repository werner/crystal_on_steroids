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
    self[1, size - 1]
  end

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

  # Returns the beginning of the array up to `position`.
  #
  # ```
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
  # ```
  #
  def to(position : Int)
    self[0..position]
  end

  # Divides the array into one or more subarrays based on a delimiting `value`
  # or the result of an optional block.
  #
  # ```
  # [1, 2, 3, 4, 5].split(3)
  # => [[1, 2], [4, 5]]
  # ```
  def split(value = nil)
    arr = self
    result = [] of typeof(arr)
    while (idx = arr.index(value))
      response = arr[0, idx]
      arr = arr[idx, size]
      result.push(response)
      arr = arr.rest
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
    arr = self
    result = [] of typeof(arr)
    while (idx = arr.index { |i| yield i })
      result << arr[0, idx]
      arr = arr[idx, size]
      arr = arr.rest
    end
    result << arr
  end

  # Splits or iterates over the array in `number` of groups, padding any
  # remaining slots with +fill_with+ unless it is `false`.
  #
  # ```
  #   %w(1 2 3 4 5 6 7 8 9 10).in_groups(3) {|group| p group}
  #   ["1", "2", "3", "4"]
  #   ["5", "6", "7", nil]
  #   ["8", "9", "10", nil]
  #
  #   %w(1 2 3 4 5 6 7 8 9 10).in_groups(3, '&nbsp;') {|group| p group}
  #   ["1", "2", "3", "4"]
  #   ["5", "6", "7", "&nbsp;"]
  #   ["8", "9", "10", "&nbsp;"]
  #
  #   %w(1 2 3 4 5 6 7).in_groups(3, false) {|group| p group}
  #   ["1", "2", "3"]
  #   ["4", "5"]
  #   ["6", "7"]
  # ```
  #
  def in_groups(number, fill_with = nil)
    division = size / number
    modulo = size % number

    groups = [] of Array(T | Nil | Bool)
    start = 0

    number.times do |index|
      last_group = [] of T | Nil | Bool
      length = division + (modulo > 0 && modulo > index ? 1 : 0)
      self[start..(start + (length - 1))].each { |e| last_group << e }
      groups << last_group
      last_group.push(fill_with) if fill_with != false &&
                                    modulo > 0 && length == division
      start += length
    end
    groups
  end

  def in_groups(number, fill_with = nil)
    groups = in_groups(number, fill_with)

    groups.each { |g| yield(g) }
  end

  # Array#slice(index : Int)
  #
  # Returns the element of the array at the passed in Index.
  def slice(index : Int) : T
    self[index]
  end

  # Array#slice(index : Int, length : Int)
  #
  # Returns a sub array starting from the index for the length
  # thats passed.
  def slice(index : Int, length : Int) : Array(T)
    self[index, (index+length)]
  end

  # Array#slice(range : Range(Int, Int))
  #
  # Returns a sub array based on the range passed in.
  def slice(range : Range(Int, Int)) : Array(T)
    self[range]
  end
end
