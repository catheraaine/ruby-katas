require_relative "../lib/trangle"

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

  def print_test_name
    puts "=> Running: #{@name.capitalize}"
  end

  def print_result
    puts "    Result of (#{@a}, #{@b}, #{@c}) is: #{classify(@a, @b, @c)}."
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
run_a_test?('random_numbers', (1 + rand(10)), (1 + rand(10)), (1 + rand(10)))
# run_a_test('not_a_triangle', 42, 5, 5)
