class Array(T)
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
end
