# Triangle Classification

# A triangle can be classified across a few dimensions,
# one of which is based on the lengths of its sides.

# A triangle is scalene if all of its three sides are different.

# If two of its sides are equal, a triangle is called isosceles.

# A triangle with all three equal sides is called equilateral.

# Requirements

# Create a class TriangleClassifier with the following method:
# type(len1, len2, len3)
# This method accepts three numeric values each representing the
# length of one side of a triangle. It returns a symbol,
# :scalene, :isosceles, or :equilateral, where the return value
# corresponds to the actual type of the triangle.

# In addition, the classify method should perform error checking
# if the given lengths of the sides cannot correspond to a real triangle.
# In this case, it should raise the error ArgumentError.

######################################################################


class Triangle
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c

    validate!
  end

  def equilateral?
    (a == b) && (b == c)
  end

  def isosceles?
    ( (a == b) || (b == c) || (c == a) ) and not equilateral?

  end

  def scalene?
    (a != b) && (b != c)
  end

  def type
    if equilateral?
      :equilateral
    elsif isosceles?
      :isosceles
    else
      :scalene
    end
  end

  def validate!
    raise TriangleError.new("Sides must be greater than zero.") if a <= 0 || b <= 0 || c <= 0
    raise TriangleError.new("The sum of two sides is smaller than the third.") if (a+b<=c) || (b+c<=a) || (a+c<=b)
  end

end

TriangleError = Class.new(StandardError)
