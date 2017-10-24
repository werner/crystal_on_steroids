struct Number
  # A number object will be blank if it's zero.
  #
  # ```
  # 0.blank?
  # => true
  #
  # 23.45.blank?
  # => false
  # ```
  #
  # source: Rails ActiveSupport
  def blank?
    zero?
  end
end
