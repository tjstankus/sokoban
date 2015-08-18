require "spec_helper"

module Sokoban
  RSpec.describe "Person" do
    let(:level) { Level.new(" @ ") }

    it "moves left into open space" do
      level.move_left
      expect(level.to_s).to eq("@  ")
    end

    it "moves right into open space" do
      level.move_right
      expect(level.to_s).to eq("  @")
    end
  end
end
