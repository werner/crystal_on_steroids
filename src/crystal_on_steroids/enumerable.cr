module Enumerable(T)
  # An enumerable is blank if it's empty.
  #
  # ```
  # [1,2,3].blank?
  # => false
  # [].blank?
  # => true
  # ```
  #
  # source: Rails ActiveSupport
  def blank?
    empty?
  end

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

  # Convert an enumerable to an array based on the given key, throws an error if any key does not exists.
  #
  # ```
  # [{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pluck(:name)
  # => ["David", "Rafael", "Aaron"]
  #
  # [{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pluck(:id, :name)
  # => [{1, "David"}, {2, "Rafael"}]
  # ```
  #
  # source: Rails ActiveSupport
  def pluck(*keys)
    if keys.many?
      map { |item| keys.map { |key| item[key] } }
    else
      map { |item| item[keys.first] }
    end
  end

  # Convert an enumerable to an array based on the given key, returns nil if any key does not exists.
  #
  # ```
  # [{ name: "David" }, { name: "Rafael" }, { name: "Aaron" }].pluck(:name)
  # => ["David", "Rafael", "Aaron"]
  #
  # [{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pluck(:id, :name)
  # => [{1, "David"}, {2, "Rafael"}]
  #
  # [{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pluck(:color)
  # => []
  #
  # [{ id: 1, name: "David" }, { id: 2, name: "Rafael" }].pluck(:id, :color)
  # => [{1, nil}, {2, nil}]
  # ```
  #
  # source: Rails ActiveSupport
  def pluck?(*keys)
    if keys.many?
      map { |item| keys.map { |key| item[key]? } }.compact
    else
      map { |item| item[keys.first?]? }.compact
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
