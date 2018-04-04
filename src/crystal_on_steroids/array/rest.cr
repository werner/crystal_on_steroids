class Array(T)
  # Returns the elements in an array except the first one.
  #
  # ```
  # [1, 2, 3, 4, 5].rest
  # => [2, 3, 4, 5]
  # ```
  def rest
    self[1..-1]
  end
end
