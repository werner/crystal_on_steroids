class Object
  def dig
    self
  end

  # Retrieves the value object corresponding to the each key objects repeatedly.
  # The type needs to implement #[]? method to works.
  #
  # ```
  # h = { foo: {bar: {baz: 5}}}
  #
  # h.dig(:foo, :bar, :baz)           #=> 5
  # h.dig(:foo, :blah)                #=> nil
  # ```
  def dig(index, *keys)
    if self.responds_to?(:[]?)
      item = self[index]?
      keys.empty? ? item : item.dig(*keys)
    end
  end
end
