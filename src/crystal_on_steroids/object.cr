class Object
  # An object is blank if it's false, empty, or an empty string.
  # For example, `false`, "", `nil`, [], and {} are all blank.
  #
  # @return [true, false]
  def blank?
    self.responds_to?(:empty?) ? !!self.empty? : !self
  end
end
