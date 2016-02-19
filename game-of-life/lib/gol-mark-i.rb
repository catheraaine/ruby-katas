
# A cell with value of 1 is considered alive, or true.
# A cell with a value of 0 is considered dead, or false.
# A cell's neighbors inculde the eight surrounding values - all four sides and diagonals.

# a = [             indexes:             abstract:
# [0, 0, 0]     [0][0], [0][1], [0][2]    [x-1][y-1],   [x-1][y],     [x-1][y+1]
# [0, 1, 0]     [1][0], [1][1], [1][2]    [x][y-1],      [x][y],      [x][y+1]
# [0, 0, 0]     [2][0], [2][1], [2][2]    [x+1][y-1],   [x+1][y],     [x+1][y+1]
#      ]



class Cycle
  attr_reader :evolved, :width, :height
  attr_accessor :cells

  def initialize

  end

  def create_life(width, height, cell_state)
    @cells = cell_state
    @evolved = Array.new(width){Array.new(height)}

  end

  def lonely?
    @neighbors < 2
  end

  def crowded?
    @neighbors > 3
  end

  def happy?
    @neighbors == 2 || @neighbors == 3
  end

  def zombie?
    @neighbors == 3
  end

  def is_negative?(n)
    (n - 1) < 0
  end

  # def add_outside(x, y)
  #
  #   if !cells[x+1][y+1]
  #     cells[x+1][y+1] = 0
  #   end
  #
  #   if !cells[x+1][y]
  #     cells[x+1][y] = 0
  #   end
  #
  #   if !cells[x][y+1]
  #     cells[x][y+1] = 0
  #   end
  #
  # end

  def neighbor_count(x, y)

    # add_outside(x, y)

    count = 0
    count += 1 if (cells[x - 1][y - 1] == 1) #cells.fetch(i) { |i| if i-1 >= 0 do i-1 else 0 end}   #=> 16
    count += 1 if (cells[x - 1][y] == 1)
    count += 1 if (cells[x - 1][y + 1] == 1)
    count += 1 if (cells[x][y + 1] == 1)
    count += 1 if (cells[x + 1][y - 1] == 1)
    count += 1 if (cells[x + 1][y] == 1)
    count += 1 if (cells[x + 1][y + 1] == 1)
    return count
  end
  #
  # def fix_strings(n)
  #   if n == "1" || n == 1
  #     n = 1
  #   else
  #     n = 0
  #   end
  #   return n
  # end

  def evolve

    cells.each_with_index do |x, xi|

      x.each_with_index do |y, yi|

        # x = fix_strings(x)
        # y = fix_strings(y)

        @neighbors = 0
        @neighbors += neighbor_count(xi, yi)

        if lonely?
          @evolved[xi][yi] = 0
        elsif crowded?
          @evolved[xi][yi] = 0
        elsif happy?
          @evolved[xi][yi] = 1
        elsif zombie?
          @evolved[xi][yi] = 1
        end

      end
    end

    return @evolved

  end

end
