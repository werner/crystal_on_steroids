struct NamedTuple
  # Returns `true` if this named tuple is empty.
  #
  # ```
  # tuple = {name: "Crystal", year: 2011}
  # tuple.blank? # => false
  # ```
  def blank?
    self.empty?
  end
end
