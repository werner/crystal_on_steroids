module Enumerable(T)
  # Returns `true` if many elements fulfilled the block condition,
  # much like any?, so `people.many? { |p| p.age > 26 }` returns `true`
  # if more than one person is over 26.
  #
  # source: Rails ActiveSupport
  def many?
    cnt = 0
    any? do |element|
      cnt += 1 if yield element
      cnt > 1
    end
  end

  # Returns `true` if the enumerable has more than 1 element. functionally
  # equivalent to `enum.to_a.size > 1`.
  #
  # source: Rails ActiveSupport
  def many?
    many? &.itself
  end

  # Convert an enumerable to an array based on the given key.
  #
  # ```
  # [{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pluck(:name)
  #   => ["David", "Rafael", "Aaron"]
  #
  # [{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pluck(:id, :name)
  #   => [{1, "David"}, {2, "Rafael"}]
  # ```
  #
  # source: Rails ActiveSupport
  def pluck(*keys)
    if keys.many?
      map { |item| keys.map { |key| item[key]? } }
    else
      map { |item| item[keys.first] }
    end
  end

  # Returns `true` if the collection does not contains *obj*, `false` otherwise.
  #
  # ```
  # [1, 2, 3].excludes?(4) # => true
  # [1, 2, 3].excludes?(3) # => false
  # ```
  #
  # source: Rails ActiveSupport
  def excludes?(obj)
    !includes?(obj)
  end

  # Returns a copy of the enumerable without the specified items.
  #
  # ```
  # [1, 2, 3, 4, 5].without 3, 5
  # => [1, 2, 4]
  # ```
  #
  # source: Rails ActiveSupport
  def without(*items)
    reject { |item| items.includes?(item) }
  end

  # Returns the average of a collection of numbers.
  #
  # ```
  # [1, 2, 3, 4, 5].avg
  # => 3
  # ```
  def avg
    self.sum / self.size
  end
end
