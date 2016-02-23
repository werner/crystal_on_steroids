struct JSON::Any

  # Same behavior as each, it checks if it's an `Array` or `Hash`,
  # raises an error otherwise.
  def reduce(memo = nil)
    case object = @raw
    when Array
      object.reduce(memo) do |acc, i|
        yield acc, i
      end
    when Hash
      object.reduce(memo) do |acc, key, value|
        yield acc, key, value
      end
    else
      raise "expected Array or Hash for #reduce, not #{object.class}"
    end
  end
end
