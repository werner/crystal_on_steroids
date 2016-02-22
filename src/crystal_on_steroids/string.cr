class String
  # A string should be blank for only whitespace characters.
  def blank?
    !!self.strip.empty?
  end

  # Alters the string by removing all occurrences of the patterns.
  # ```
  # str = "foo bar test"
  # str.remove(" test", /bar/)         # => "foo "
  # str                                 # => "foo "
  # ```
  #
  # source: Rails ActiveSupport
  def remove(*patterns)
    patterns.map do |pattern|
      gsub pattern, ""
    end.first
  end

  # Truncates a given `text` after a given `size` if `text` is longer than `size`:
  #
  #  ```
  #  "Once upon a time in a world far far away".truncate(27)
  #  # => "Once upon a time in a wo..."
  #  ```
  #
  # Pass a string or regexp `:separator` to truncate `text` at a natural break:
  #
  #  ```
  #  "Once upon a time in a world far far away".truncate(27, separator: " ")
  #  # => "Once upon a time in a..."
  #  ```
  #
  # The last characters will be replaced with the `:omission` string (defaults to "...")
  # for a total size not exceeding `size`:
  #
  #  ```
  #  "And they found that many people were sleeping better.".truncate(25, omission: "... (continued)")
  #  # => "And they f... (continued)"
  #  ```
  #
  # source: Rails ActiveSupport
  def truncate(truncate_at, options = {} of Symbol => String)
    return dup unless size > truncate_at

    omission = options[:omission]? || "..."
    size_with_room_for_omission = truncate_at - omission.size
    stop =
      if options[:separator]?
        rindex(options[:separator], size_with_room_for_omission) || size_with_room_for_omission
      else
        size_with_room_for_omission
      end

    "#{self[0, stop]}#{omission}"
  end

  # Truncates a given `text` after a given number of words (`words_count`):
  #
  #  ```
  # "Once upon a time in a world far far away".truncate_words(4)
  # # => "Once upon a time..."
  #  ```
  #
  # Pass a string `:separator` to specify a different separator of words:
  #
  # ```
  # "Once<br>upon<br>a<br>time<br>in<br>a<br>world".truncate_words(5, separator: "<br>")
  # # => "Once<br>upon<br>a<br>time<br>in..."
  # ```
  #
  # The last characters will be replaced with the `:omission` string (defaults to "..."):
  #
  # ```
  # "And they found that many people were sleeping better.".truncate_words(5, omission: "... (continued)")
  # # => "And they found that many... (continued)"
  # ```
  #
  # source: Rails ActiveSupport
  def truncate_words(words_count, options = {} of Symbol => String)
    sep = options[:separator]? || " "
    sep = Regex.escape(sep.to_s) unless Regex === sep
    if self =~ /\A((?>.+?#{sep}){#{words_count - 1}}.+?)#{sep}.*/m
      $1 + (options[:omission]? || "...")
    else
      dup
    end
  end
end
