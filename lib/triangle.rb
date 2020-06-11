class Triangle

  attr_accessor :side_1, :side_2, :side_3

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
  end

  def kind
    if all_zeros || triangle_inequality
      raise TriangleError
    end
    #should raise error if triangle is invalid
    #0 or negative numbers are illegal
    #violating triangle inequality is illegal

    if side_1 == side_2 && side_2 == side_3
      return :equilateral
    elsif side_1 != side_2 && side_2 != side_3 && side_3 != side_1
      return :scalene
    else
      return :isosceles
    end
    #:equilateral all 3 sides will be the same
    #:isosceles has 2 sides equal
    #:scalene has 0 equal sides
    #any triangle that is a float is valid
  end

  def all_zeros
    side_1 <= 0 || side_2 <= 0 || side_3 <= 0
  end

  def triangle_inequality
    side_1 >= (side_2 + side_3) || side_2 >= (side_1 + side_3) || side_3 >= (side_2 + side_1)
  end

  class TriangleError < StandardError
  end

end
