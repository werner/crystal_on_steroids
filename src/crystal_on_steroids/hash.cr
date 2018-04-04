class Hash(K, V)
  # Returns a hash with non `nil` values.
  #
  # ```
  # hash = { a: true, b: false, c: nil}
  # hash.compact # => { a: true, b: false }
  # hash # => { a: true, b: false, c: nil}
  # { c: nil }.compact # => {}
  # ```
  #
  # source: ActiveSupport
  #
  # This method is already included in Crystal, but there is a bug, so I'm keeping my own implementation of Hash#compact.
  def compact
    self.reject { |_, value| value.nil? }
  end

  # Replaces current hash with non `nil` values.
  #
  # ```
  # hash = { a: true, b: false, c: nil }
  # hash.compact! # => { a: true, b: false }
  # hash # => { a: true, b: false }
  # ```
  #
  # source: Rails ActiveSupport
  def compact!
    self.reject! { |_, value| value.nil? }
  end
end
