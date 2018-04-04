class String
  # Alters the string by removing all occurrences of the patterns.
  # ```
  # str = "foo bar test"
  # str.remove(" test", /bar/)         # => "foo "
  # str                                # => "foo "
  # ```
  #
  # source: Rails ActiveSupport
  def remove(*patterns)
    dup = self.dup
    patterns.each do |pattern|
      dup = dup.gsub(pattern, "")
    end
    dup
  end
end
