struct Time
  # Moves one day in the past.
  def yesterday
    self - 1.day
  end

  # Moves one day in the future.
  def tomorrow
    self + 1.day
  end
end
