struct Nil
  # A nil object always will be blank.
  #
  # ```
  # nil.blank?
  # => true
  # ```
  #
  # source: Rails ActiveSupport
  def blank?
    true
  end
end
