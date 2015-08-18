require "spec_helper"

module Sokoban
  RSpec.describe "Person" do
    it "moves left into open space" do
      level = single_line_level
      level.move_left
      expect(level.to_s).to eq("@  \n")
    end

    it "moves right into open space" do
      level = single_line_level
      level.move_right
      expect(level.to_s).to eq("  @\n")
    end

    it "moves up into open space" do
      level = multi_line_level
      level.move_up
      expect(level.to_s).to eq(" @ \n   \n   \n")
    end

    it "moves down into open space" do
      level = multi_line_level
      level.move_down
      expect(level.to_s).to eq("   \n   \n @ \n")
    end

  end
end
