module Enumerable(T)
  # Checks if exactly n elements meet a certain predicate with a block.
  #
  # ```
  #   [1, 2, 3, 4].exactly?(1) { |n| n > 3 } #=> true
  #   [1, 2, 3, 4].exactly?(2, &.even?) #=> true
  #   [1, 1, 3, 3].exactly?(2, &.even?) #=> false
  # ```
  #
  def exactly?(count : Int32)
    found_count = 0

    each do |e|
      found_count += 1 if yield e
    end
    found_count == count
  end
end
