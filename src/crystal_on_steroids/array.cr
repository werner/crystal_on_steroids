class Array(T)
  macro define_order(name, number)
    def {{name.id}}
      @size > {{number}} ? @buffer[{{number}}] : raise IndexError.new
    end
  end

  define_order :second, 1
  define_order :third,  2
  define_order :fourth, 3
  define_order :fifth,  4

end
