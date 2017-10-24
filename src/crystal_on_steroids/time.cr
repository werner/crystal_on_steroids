struct Time
  # Moves one day in the past.
  def prev_day
    self.at_beginning_of_day - 1.day
  end

  # Moves one day in the future.
  def next_day
    self.at_beginning_of_day + 1.day
  end

  # Moves one day in the past.
  def yesterday
    prev_day
  end

  # Moves one day in the future.
  def tomorrow
    next_day
  end

  #Check if the especified time is corresponding to today
  def today?
    now = Time.now
    now.at_beginning_of_day <= self <= now.at_end_of_day
  end
end
