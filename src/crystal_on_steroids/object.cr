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

  # source: https://github.com/mperham/sidekiq/blob/e447dae961ebc894f12848d9f33446a07ffc67dc/lib/sidekiq.rb#L52
  def self.❨╯°□°❩╯︵┻━┻
    puts "Calm down, yo."
  end
end
