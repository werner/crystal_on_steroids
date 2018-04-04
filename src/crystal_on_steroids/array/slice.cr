class Array(T)
  # Array#slice(index : Int)
  #
  # Returns the element of the array at the passed in Index.
  def slice(index : Int) : T
    self[index]
  end

  # Array#slice(index : Int, length : Int)
  #
  # Returns a sub array starting from the index for the length
  # thats passed.
  def slice(index : Int, length : Int) : Array(T)
    self[index, (index+length)]
  end

  # Array#slice(range : Range(Int, Int))
  #
  # Returns a sub array based on the range passed in.
  def slice(range : Range(Int, Int)) : Array(T)
    self[range]
  end
end
