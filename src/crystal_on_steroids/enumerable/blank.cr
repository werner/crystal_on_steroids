module Enumerable(T)
  # An enumerable is blank if it's empty.
  #
  # ```
  # [1,2,3].blank?
  # => false
  # [].blank?
  # => true
  # ```
  #
  # source: Rails ActiveSupport
  def blank?
    empty?
  end
end
