class String
  # Remove first and last whitespace and reduce to one 
  # all the others in the same sentence
  #
  # ```
  # " foo   bar    \n   \t   boo".squish # => "foo bar boo"
  # ```
  #
  # source: Rails ActiveSupport
  def squish
    gsub(/[[:space:]]+/, " ").strip
  end
end
