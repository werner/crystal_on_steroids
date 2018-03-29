struct Int
  # Returns the suffix that should be added to a number to denote the position
  # in an ordered sequence such as 1st, 2nd, 3rd, 4th.
  #
  # ```
  #   1.ordinal     # => "st"
  #   2.ordinal     # => "nd"
  #   1002.ordinal  # => "nd"
  #   1003.ordinal  # => "rd"
  #   -11.ordinal   # => "th"
  #   -1021.ordinal # => "st"
  # ```
  def ordinal
    abs_number = self.to_i.abs

    if (11..13).includes?(abs_number % 100)
      "th"
    else
      case abs_number % 10
      when 1; "st"
      when 2; "nd"
      when 3; "rd"
      else    "th"
      end
    end
  end

  # Turns a number into an ordinal string used to denote the position in an
  # ordered sequence such as 1st, 2nd, 3rd, 4th.
  #
  # ```
  #   1.ordinalize     # => "1st"
  #   2.ordinalize     # => "2nd"
  #   1002.ordinalize  # => "1002nd"
  #   1003.ordinalize  # => "1003rd"
  #   -11.ordinalize   # => "-11th"
  #   -1021.ordinalize # => "-1021st"
  # ```
  def ordinalize
    "#{self}#{ordinal}"
  end
end
