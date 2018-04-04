module Enumerable(T)
  # Returns `true` if the collection does not contains *obj*, `false` otherwise.
  #
  # ```
  # [1, 2, 3].excludes?(4) # => true
  # [1, 2, 3].excludes?(3) # => false
  # ```
  #
  # source: Rails ActiveSupport
  def excludes?(obj)
    !includes?(obj)
  end
end
