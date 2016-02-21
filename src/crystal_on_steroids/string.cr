class String
  # A string should be blank for only whitespace characters.
  def blank?
    !!self.strip.empty?
  end
end
