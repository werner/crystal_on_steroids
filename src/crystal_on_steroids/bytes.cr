require "big"

struct Number
  include AliasMethod

  KILOBYTE = 1024.to_big_i
  MEGABYTE = KILOBYTE * 1024
  GIGABYTE = MEGABYTE * 1024
  TERABYTE = GIGABYTE * 1024
  PETABYTE = TERABYTE * 1024
  EXABYTE  = PETABYTE * 1024

  # Enables the use of byte calculations and declarations, like 45.bytes + 2.6.megabytes
  #
  # ```
  #   2.bytes # => 2
  # ```
  def bytes
    self
  end
  alias_method :byte, :bytes

  # Returns the number of bytes equivalent to the kilobytes provided.
  #
  # ```
  #   2.kilobytes # => 2048
  # ```
  def kilobytes
    self * KILOBYTE
  end
  alias_method :kilobyte, :kilobytes

  # Returns the number of bytes equivalent to the megabytes provided.
  #
  # ```
  #   2.megabytes # => 2_097_152
  # ```
  def megabytes
    self * MEGABYTE
  end
  alias_method :megabyte, :megabytes

  # Returns the number of bytes equivalent to the gigabytes provided.
  #
  # ```
  #   2.gigabytes # => 2_147_483_648
  # ```
  def gigabytes
    self * GIGABYTE
  end
  alias_method :gigabyte, :gigabytes

  # Returns the number of bytes equivalent to the terabytes provided.
  #
  # ```
  #   2.terabytes # => 2_199_023_255_552
  # ```
  def terabytes
    self * TERABYTE
  end
  alias_method :terabyte, :terabytes

  # Returns the number of bytes equivalent to the petabytes provided.
  #
  # ```
  #   2.petabytes # => 2_251_799_813_685_248
  # ```
  def petabytes
    self * PETABYTE
  end
  alias_method :petabyte, :petabytes

  # Returns the number of bytes equivalent to the exabytes provided.
  #
  # ```
  #   2.exabytes # => 2_305_843_009_213_693_952
  # ```
  def exabytes
    self * EXABYTE
  end
  alias_method :exabyte, :exabytes
end
