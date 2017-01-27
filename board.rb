require_relative 'tile'

class Board
  def initialize(size, num_of_bombs)
    @size = size
    @num_of_bombs = num_of_bombs
    @grid = Array.new(size) { Array.new(size) }
  end

  def place_bombs
    until @grid.flatten.count(:bomb) == @num_of_bombs
      pos = [rand(@size - 1), rand(@size - 1)]
      self[pos] = :bomb
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

end
