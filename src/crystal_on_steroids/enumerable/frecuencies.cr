module Enumerable(T)
  # Counts the number of occurrence of items in the enumerable.
  #
  # ```
  #   [].frequencies # => {}
  #   [1, :symbol, 'string', 3, :symbol, 1].frequencies
  #     #=> { 1 => 2, :symbol => 2, 'string' => 1, 3 => 1 }
  # ```
  #
  # source: Powerpack
  def frequencies
    hash = {} of T => Int32
    each_with_object(hash) do |e, a|
      a[e] = 0 unless a[e]?
      a[e] += 1
    end
  end
end
