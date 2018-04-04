module Enumerable(T)
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
end
