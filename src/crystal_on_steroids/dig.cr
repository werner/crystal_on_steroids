# Object#dig and Object#dig? methods are used to returns deeply nested values.
# Ideas taken from: https://www.reddit.com/r/crystal_programming/comments/477bnn/crystal_on_steroids/d0c07lt
module Dig
  def dig(index)
    self[index]?
  end

  # Retrieves the value object corresponding to the each key objects repeatedly.
  #
  # ```
  # h = { foo: {bar: {baz: 5}}}
  #
  # h.dig(:foo, :bar, :baz)           #=> 5
  # h.dig(:foo, :blah)                #=> nil
  # ```
  def dig(index, *keys)
    item = self[index]?
    if item.responds_to?(:dig)
      item.dig(*keys)
    else
      raise Exception.new("#{item.class} does not respond to #dig")
    end
  end
end

class Object
  def dig?
    self
  end

  # Retrieves the value object corresponding to the each key objects repeatedly.
  # The type needs to implement #[]? method to works.
  #
  # ```
  # h = { foo: {bar: {baz: 5}}}
  #
  # h.dig?(:foo, :bar, :baz)           #=> 5
  # h.dig?(:foo, :blah)                #=> nil
  # ```
  def dig?(index, *keys)
    if self.responds_to?(:[]?)
      item = self[index]?
      keys.empty? ? item : item.dig?(*keys)
    end
  end
end

class Array
  include Dig
end

class Hash
  include Dig
end

struct JSON::Any
  include Dig
end

struct YAML::Any
  include Dig
end
