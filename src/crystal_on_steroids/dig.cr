class Hash(K, V)
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

struct JSON::Any
  # Retrieves the value object corresponding to the each key objects repeatedly.
  #
  # ```
  # h = {"access": {"name": {"greetings": "hi" }, "speed": 43}}
  #
  # h.dig("access", "name", "greetings")  #=> hi
  # h.dig("access", "name", "farewell")   #=> nil
  # ```
  def dig(*keys)
    keys.reduce(self) do |hash, key|
      hash[key]? if hash.is_a?(JSON::Any)
    end
  end
end

struct YAML::Any
  # Retrieves the value object corresponding to the each key objects repeatedly.
  #
  # ```
  #
  #  data = YAML.parse <<-END
  #           ---
  #           country:
  #             city:
  #               age:
  #                 - 23
  #           END
  #
  # h.dig("country", "city", "age")  #=> 23
  # h.dig("country", "city", "color")   #=> nil
  # ```
  def dig(*keys)
    keys.reduce(self) do |hash, key|
      hash[key]? if hash.is_a?(YAML::Any)
    end
  end
end
