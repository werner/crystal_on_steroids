class Hash(K, V)
  # Returns a hash with non `nil` values.
  #
  # ```
  #  hash = { a: true, b: false, c: nil}
  #  hash.compact # => { a: true, b: false }
  #  hash # => { a: true, b: false, c: nil}
  #  { c: nil }.compact # => {}
  #  ```
  #
  # source: ActiveSupport
  def compact
    self.select { |_, value| !value.nil? }
  end

  # Replaces current hash with non +nil+ values.
  #
  #   ```
  #   hash = { a: true, b: false, c: nil }
  #   hash.compact! # => { a: true, b: false }
  #   hash # => { a: true, b: false }
  #   ```
  #
  # source: Rails ActiveSupport
  def compact!
    self.reject! { |_, value| value.nil? }
  end


  # Retrieves the value object corresponding to the each key objects repeatedly.
  #
  # ```
  # h = { foo: {bar: {baz: 5}}}
  #
  # h.dig(:foo, :bar, :baz)           #=> 5
  # h.dig(:foo, :blah)                #=> nil
  # ```
  def dig(*keys)
    keys.reduce(self) do |hash, key|
      hash[key]? if hash.is_a?(Hash)
    end
  end
end
