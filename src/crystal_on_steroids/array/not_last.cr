class Array(T)
  # Returns the elements in an array except the last one.
  #
  # ```
  # [1, 2, 3, 4, 5].not_last
  # => [1, 2, 3, 4]
  # ```
  def not_last
    self[0..-2]
  end
end
