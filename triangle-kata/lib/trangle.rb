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

######################################################################
# Testing
######################################################################

class Triangle_test

  def initialize(name, a_side, b_side, c_side)
    @a = a_side
    @b = b_side
    @c = c_side
    @name = name
  end


  def print_result
    puts "    Result of (#{@a}, #{@b}, #{@c}) is: #{classify(@a, @b, @c)}."
  end

  def print_test_name
    puts "=> Running: #{@name.capitalize}"
  end

end

def run_a_test?(name, a, b, c)
  name = Triangle_test.new(name, a, b, c)
  name.print_test_name
  name.print_result

end

run_a_test?('equilateral', 4, 4, 4)
run_a_test?('scaline', 2, 3, 4)
run_a_test?('isosceles', 4, 5, 5)
# run_a_test('not_a_triangle', 42, 5, 5)
run_a_test?('random_numbers', (1 + rand(10)), (1 + rand(10)), (1 + rand(10)))





######################################################################
# Alternate Path
######################################################################

# def isosceles (a, b, c)
#   ((a == b) || (b == c) || (a == c))? :isosceles : false
# end
#
#
# def equilateral (a, b, c)
#   ((a == b ) && (a == c))? :equilateral : false
# end
#
#
# def scalene (a, b, c)
#   ((a > 0) && (b > 0) && (c > 0))? :scalene : false
# end



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
