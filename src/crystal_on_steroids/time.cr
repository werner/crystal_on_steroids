struct Time
  # Moves one day in the past.
  def prev_day
    self - 1.day
  end

  # Moves one day in the future.
  def next_day
    self + 1.day
  end

  # Moves one day in the past.
  def yesterday
    prev_day
  end

  # Moves one day in the future.
  def tomorrow
    next_day
  end
end
