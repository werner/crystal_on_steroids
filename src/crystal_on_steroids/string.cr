class String
  # A string should be blank for only whitespace characters.
  def blank?
    !!self.strip.empty?
  end

  # Alters the string by removing all occurrences of the patterns.
  # ```
  # str = "foo bar test"
  # str.remove(" test", /bar/)         # => "foo "
  # str                                 # => "foo "
  # ```
  #
  # source: Rails ActiveSupport
  def remove(*patterns)
    patterns.map do |pattern|
      gsub pattern, ""
    end.first
  end
end
