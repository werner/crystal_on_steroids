module Enumerable(T)
  # Returns `true` if many elements fulfilled the block condition,
  # much like any?, so `people.many? { |p| p.age > 26 }` returns `true`
  # if more than one person is over 26.
  #
  # source: Rails ActiveSupport
  def many?
    cnt = 0
    each do |element|
      cnt += 1 if yield element
    end
    cnt > 1
  end

  # Returns `true` if the enumerable has more than 1 element. functionally
  # equivalent to `enum.size > 1`.
  #
  # source: Rails ActiveSupport
  def many?
    size > 1
  end
end
