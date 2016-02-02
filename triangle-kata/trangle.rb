# Triangle Classification

# A triangle can be classified across a few dimensions,
# one of which is based on the lengths of its sides.

# A triangle is scalene if all of its three sides are different.

# If two of its sides are equal, a triangle is called isosceles.

# A triangle with all three equal sides is called equilateral.

# Requirements

# Create a class TriangleClassifier with the following method:
# classify(len1, len2, len3)
# This method accepts three numeric values each representing the
# length of one side of a triangle. It returns a symbol,
# :scalene, :isosceles, or :equilateral, where the return value
# corresponds to the actual type of the triangle.

# In addition, the classify method should perform error checking
# if the given lengths of the sides cannot correspond to a real triangle.
# In this case, it should raise the error ArgumentError.

######################################################################
def classify(a, b, c)

  if #(a<=0) || (b<=0) || (c<=0) ||#
    (a+b<=c) || (b+c<=a) || (a+c<=b)
    raise ArgumentError

  elsif (a == b ) && (b == c) && (a == c)
    return :equilateral

  elsif (a == b) || (b == c) || (a == c)
    return :isosceles

  elsif (a > 0) && (b > 0) && (c > 0)
    return :scalene

  end

end




# in lib/calculator.rb
class Calculator
  def add(a, b)
  end
end

######################################################################
# def equilateral (a, b, c)
#  if (a == b ) && (b == c) && (a == c)
#    return :equilateral
#  end
# end

######################################################################

def isosceles (a, b, c)
  ((a == b) || (b == c) || (a == c))? :isosceles : false
end


def equilateral (a, b, c)
  ((a == b ) && (a == c))? :equilateral : false
end


def scalene (a, b, c)
  ((a > 0) && (b > 0) && (c > 0))? :scalene : false
end



# def classify2 (a, b, c)
#
#   if #(a<=0) || (b<=0) || (c<=0) ||#
#     (a+b<=c) || (b+c<=a) || (a+c<=b)
#     raise ArgumentError
#
#   elsif equilateral(a, b, c)
#     puts :equilateral
#   elsif isosceles(a, b, c)
#     puts :isosceles
#   elsif scalene(a, b, c)
#     puts :scalene
#
#   end
# end




######################################################################


class ArgumentError < StandardError


end


######################################################################

# def test_is_isosceles?
#   puts isosceles(7, 7, 9)
#   puts isosceles(1, 2, 3)
# end
#
# def test_is_equilateral?
#   puts equilateral(7, 7, 7)
#   puts equilateral(1, 2, 3)
# end
#
# def test_classify2?
#   puts classify2(2, 2, 3) #isosceles
#   puts classify2(3, 3, 3) #equilateral
#   puts classify2(3, 4, 5) #scalene
#   puts classify2(82, 5, 3)
#
# end
#
#
#
# puts "classify2"
# test_classify2?
