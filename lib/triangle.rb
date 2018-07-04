class Triangle
  attr_reader :a, :b, :c
  
  def initialize(a, b, c)
    @a = a
    @b = b 
    @c = c 
  end
  
  def kind 
    @a, @b, @c = [@a, @b, @c].sort
    if (@a + @b <= @c) || (@a <= 0) || (@b <= 0) || (@c <= 0) 
      begin 
        raise TriangleError 
      rescue TriangleError => error 
        puts error.message
      end
    end 
    case [a,b,c].uniq.size
      when 3; :scalene
      when 2; :isosceles
      when 1; :equilateral
    end
  end
  
  class TriangleError < StandardError 
    def message 
      "The sum of the lengths of the triangle's two sides must be larger than the length of the third side, the length of any side can not be 0!"
    end
  end 
end
