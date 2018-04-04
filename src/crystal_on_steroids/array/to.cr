class Array(T)
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

end
