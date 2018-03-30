struct Range(B, E)
  # Compare two ranges and see if they overlap each other
  # ```
  #  (1..5).overlaps?(4..6) # => true
  #  (1..5).overlaps?(7..9) # => false
  # ```
  def overlaps?(other : Range) : Bool
    covers?(other.first) || other.covers?(first)
  end
end
