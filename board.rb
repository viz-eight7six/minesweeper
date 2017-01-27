require_relative 'tile'

class Board
  attr_reader :size
  def initialize(size, num_of_bombs)
    @size = size
    @num_of_bombs = num_of_bombs
    @grid = Array.new(size) { Array.new(size) }
  end

  def place_bombs
    until @grid.flatten.count(:bomb) == @num_of_bombs
      pos = [rand(size - 1), rand(size - 1)]
      self[pos] = :bomb
    end
  end

  def place_numbers
    (size).times do |row|
      (size).times do |col|
        pos = [row, col]
        self[pos] = number_of_bombs(pos) unless self[pos] == :bomb
      end
    end
  end

  def number_of_bombs(pos)
    adjacent_squares(pos).count { |square| self[square] == :bomb }
  end

  def adjacent_squares(pos)
    row, col = pos
    adjacents = []

    (row - 1..row + 1).each do |row|
      (col - 1..col + 1).each do |col|
        next if [row, col] == pos
        adjacents << [row, col] if valid_pos?([row, col])
      end
    end

    adjacents
  end

  def valid_pos?(pos)
    row, col = pos
    (0...size).include?(row) &&
      (0...size).include?(col)
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
