class Object
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
  # ```
  # object.present? ? object : nil
  # ```
  #
  # @return [Object]
  # 
  # source: Rails ActiveSupport
  def presence
    self if present?
  end

  # Returns true if this object is included in the argument. Argument must be
  # any object which responds to `#include?`. Usage:
  #
  # ```
  # characters = ["Konata", "Kagami", "Tsukasa"]
  # "Konata".in?(characters) # => true
  # ```
  #
  # source: Rails ActiveSupport
  def in?(another_object)
    another_object.includes?(self)
  end

  # Returns the receiver if it's included in the argument otherwise returns `nil`.
  # Argument must be any object which responds to `#include?`. Usage:
  #
  # ```
  # params[:bucket_type].presence_in %w( project calendar )
  # ```
  #
  # source: Rails ActiveSupport
  def presence_in(another_object)
    self.in?(another_object) ? self : nil
  end
end
