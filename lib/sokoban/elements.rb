module Sokoban
  module Elements
    def self.for_character(char)
      Array(
        case char
        when "@"
          Person.new
        when " "
          Space.new
        else
        end
      )
    end

    class Person
      def to_s
        "@"
      end
    end

    class Space
      def to_s
        " "
      end
    end
  end
end
