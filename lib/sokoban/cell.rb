require "forwardable"

module Sokoban
  class Cell
    extend Forwardable
    
    attr_reader :elements, :coordinate

    def_delegator :@coordinate, :xy

    def initialize(elements, coordinate)
      @elements = elements
      @coordinate = coordinate
    end

    # TODO: Change this. Prefer objects to type checking.
    def contains?(klass)
      elements.any? { |elem| elem.is_a?(klass) }
    end
  end
end
