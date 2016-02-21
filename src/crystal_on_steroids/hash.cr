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
  # source: ActiveSupport
  def compact!
    self.reject! { |_, value| value.nil? }
  end
end
