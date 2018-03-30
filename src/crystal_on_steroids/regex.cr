class Regex
  # Returns `true` if a character match at specified index. Matches a regular expression against `String`
  # *str*. Starts at the character index given by *pos* if given, otherwise at
  # the start of *str*. Returns a `Regex::MatchData` if *str* matched, otherwise
  # `nil`. `$~` will contain the same value that was returned.
  #
  # ```
  # /ab/.match?("abc")              # => true
  # /z/.match?("abc", 1).try &.[2]  # => false
  # ```
  def match?(str, pos = 0, options = Regex::Options::None) : Bool
    !!match(str, pos, options)
  end
end
