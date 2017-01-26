class Tile

VALUES = {
    :bomb => '*',
    0 => '_',
    1 => '1',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8'
}

  def initialize(value)
    @value = value
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def display
    @revealed ? VALUES[@value] : '#'
  end
end
