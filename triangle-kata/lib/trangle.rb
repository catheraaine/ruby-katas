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
    raise ArgumentError, "I am no triangle."

  elsif (a == b ) && (b == c) && (a == c)
    return :equilateral

  elsif (a == b) || (b == c) || (a == c)
    return :isosceles

  elsif (a > 0) && (b > 0) && (c > 0)
    return :scalene

  end

end


######################################################################
# Errors
######################################################################

class ArgumentError < StandardError

end
