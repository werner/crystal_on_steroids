struct Bool
  # A bool object will be blank if it's false.
  #
  # ```
  # true.blank?
  # => false
  #
  # false.blank?
  # => true
  # ```
  #
  # source: Rails ActiveSupport
  def blank?
    !self
  end
end
