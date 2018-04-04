class Array(T)
  # Splits or iterates over the array in `number` of groups, padding any
  # remaining slots with `fill_with` unless it is `false`.
  #
  # ```
  #   %w(1 2 3 4 5 6 7 8 9 10).in_groups(3) {|group| p group}
  #   ["1", "2", "3", "4"]
  #   ["5", "6", "7", nil]
  #   ["8", "9", "10", nil]
  #
  #   %w(1 2 3 4 5 6 7 8 9 10).in_groups(3, '&nbsp;') {|group| p group}
  #   ["1", "2", "3", "4"]
  #   ["5", "6", "7", "&nbsp;"]
  #   ["8", "9", "10", "&nbsp;"]
  #
  #   %w(1 2 3 4 5 6 7).in_groups(3, false) {|group| p group}
  #   ["1", "2", "3"]
  #   ["4", "5"]
  #   ["6", "7"]
  # ```
  #
  def in_groups(number, fill_with = nil)
    division = size / number
    modulo = size % number

    groups = [] of Array(T | Nil | Bool)
    start = 0

    number.times do |index|
      last_group = [] of T | Nil | Bool
      length = division + (modulo > 0 && modulo > index ? 1 : 0)
      self[start..(start + (length - 1))].each { |e| last_group << e }
      groups << last_group
      last_group.push(fill_with) if fill_with != false &&
                                    modulo > 0 && length == division
      start += length
    end
    groups
  end

  def in_groups(number, fill_with = nil)
    groups = in_groups(number, fill_with)

    groups.each { |g| yield(g) }
  end
end
