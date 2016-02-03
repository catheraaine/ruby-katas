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

  def initialize(a_side, b_side, c_side)
    @a = a_side
    @b = b_side
    @c = c_side
  end

  def print_result
    puts "    Result of (#{@a}, #{@b}, #{@c}) is: #{classify(@a, @b, @c)}."
  end

  def print_test_name
    puts "=> Running: #{__method__.capitalize}"
  end
  #
  # def print_lengths
  #   puts "The side lengths are: #{random_side_a}, #{random_side_b}, #{random_side_c}."
  # end

end

def run_a_test(name, a, b, c)
  name = Triangle_test.new(a, b, c)
  name.print_test_name
  name.print_result

end

# def test_is_a_triangle?
#   print_test_name(__method__)
#   print_result_of(82, 9, 2)
# end
#
# test_is_a_triangle?

def test_is_equilateral?
  run_a_test('equilateral', 4, 4, 4)

end

test_is_equilateral?

def test_is_scaline?
  run_a_test('scaline', 2, 3, 4)
end

test_is_scaline?

def test_is_isosceles?
  run_a_test('isosceles', 4, 5, 5)
end

test_is_isosceles?

def test_random_numbers?
  random_side_a = (1 + rand(10))
  random_side_b = (1 + rand(10))
  random_side_c = (1 + rand(10))

  run_a_test('random', random_side_a, random_side_b, random_side_c)
end

test_random_numbers?





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
