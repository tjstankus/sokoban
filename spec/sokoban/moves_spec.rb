require "spec_helper"

module Sokoban
  RSpec.describe "Person" do
    it "moves left into open space" do
      level = Level.new(" @ ")
      level.move_left
      expect(level.to_s).to eq("@  ")
    end
  end
end
