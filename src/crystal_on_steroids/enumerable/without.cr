module Enumerable(T)
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
end
