require "spec_helper"

module Sokoban
  RSpec.describe "Person" do
    it "moves west into open space" do
      level = single_line_level
      level.move(:west)
      expect(level.to_s).to eq("@  \n")
    end

    it "moves east into open space" do
      level = single_line_level
      level.move(:east)
      expect(level.to_s).to eq("  @\n")
    end

    it "moves up into open space" do
      level = multi_line_level
      level.move(:north)
      expect(level.to_s).to eq(" @ \n   \n   \n")
    end

    it "moves down into open space" do
      level = multi_line_level
      level.move(:south)
      expect(level.to_s).to eq("   \n   \n @ \n")
    end

  end
end
