$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'sokoban'

module Sokoban
  module Helpers
    def single_line_level
      Level.new(" @ ")
    end

    def multi_line_level
      Level.new("   \n @ \n   \n")
    end
  end
end

RSpec.configure do |c|
  c.include Sokoban::Helpers
end
