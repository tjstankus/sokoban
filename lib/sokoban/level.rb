module Sokoban
  class Level
    attr_reader :level_str, :grid

    def initialize(level_str)
      # TODO:10 Grid as its own class?
      @level_str = level_str
      @grid = init_grid
    end

    def to_s
      String.new.tap do |s|
        grid.each_with_index do |line, x|
          line.each { |cell| s << cell.elements.first.to_s }
          s << "\n"
          line.each_with_index do |cell, y|
          end
        end
      end
    end

    def person_cell
      grid.each_with_index do |line, x|
        line.each_with_index do |cell, y|
          return cell if cell.contains?(Elements::Person)
        end
      end
    end

    def move(direction)
      # TODO: Make more efficient?
      from_cell = person_cell
      to_cell = self.send("cell_to_#{direction}", from_cell)
      to_elements = Array.new(to_cell.elements)
      to_cell.elements.replace(from_cell.elements)
      from_cell.elements.replace(to_elements)
    end

    def cell_to_west(cell)
      x, y = cell.xy
      grid[x][y-1]
    end

    def cell_to_east(cell)
      x, y = cell.xy
      grid[x][y+1]
    end

    def cell_to_north(cell)
      x, y = cell.xy
      grid[x-1][y]
    end

    def cell_to_south(cell)
      x, y = cell.xy
      grid[x+1][y]
    end

    private

    def init_grid
      Array.new.tap do |grid|
        level_str.split("\n").each_with_index do |line, x|
          grid << Array(line)
          line.split("").each_with_index do |char, y|
            grid[x][y] = Cell.new(
              Sokoban::Elements.for_character(char),
              Coordinate.new(x,y))
          end
        end
      end
    end
  end
end
