class Object
  # An object is present if it's not blank.
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

  # source: https://github.com/mperham/sidekiq/blob/e447dae961ebc894f12848d9f33446a07ffc67dc/lib/sidekiq.rb#L52
  def self.❨╯°□°❩╯︵┻━┻
    puts "Calm down, yo."
  end
end
