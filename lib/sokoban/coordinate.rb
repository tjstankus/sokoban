module Sokoban
  class Coordinate
    attr_reader :x, :y

    def initialize(x, y)
      @x, @y = x, y
    end

    def ==(other)
      self.x == other.x && self.y == other.y
    end

    def xy
      [x, y]
    end
  end
end
