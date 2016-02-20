class Object
  # An object is blank if it's false, empty, or an empty string.
  # For example, `false`, "", `nil`, [], and {} are all blank.
  #
  # @return [true, false]
  #
  # source: Rails ActiveSupport
  def blank?
    self.responds_to?(:empty?) ? !!self.empty? : !self
  end

  # An object is present if it's not blank.
  #
  # @return [true, false]
  #
  # source: Rails ActiveSupport
  def present?
    !blank?
  end

  # Returns the receiver if it's present otherwise returns `nil`.
  # `object.presence` is equivalent to
  #
  #    ```
  #    object.present? ? object : nil
  #    ```
  #
  # @return [Object]
  # 
  # source: Rails ActiveSupport
  def presence
    self if present?
  end
end
