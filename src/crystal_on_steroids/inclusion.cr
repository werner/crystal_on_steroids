class Object
  # Returns true if this object is included in the argument. Argument must be
  # any object which responds to `#include?`. Usage:
  #
  # ```
  #   characters = ["Konata", "Kagami", "Tsukasa"]
  #   "Konata".in?(characters) # => true
  # ```
  #
  # This will throw an `ArgumentError` if the argument doesn't respond
  # to `#include?`.
  # source: Rails ActiveSupport
  def in?(another_object)
    another_object.includes?(self)
  end

  # Returns the receiver if it's included in the argument otherwise returns `nil`.
  # Argument must be any object which responds to `#include?`. Usage:
  #
  # ```
  #   params[:bucket_type].presence_in %w( project calendar )
  # ```
  #
  # source: Rails ActiveSupport
  def presence_in(another_object)
    in?(another_object) ? self : nil
  end
end
