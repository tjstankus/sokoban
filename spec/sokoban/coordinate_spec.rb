require "spec_helper"

module Sokoban
  RSpec.describe Coordinate do
    let(:x) { 0 }
    let(:y) { 1 }
    let(:coordinate) { Coordinate.new(x, y) }

    describe "#==" do
      it "returns true for coordinate with same x and y values" do
        expect(coordinate).to eq(Coordinate.new(x, y))
      end

      it "returns false for coordinate with different x value" do
        expect(coordinate).not_to eq(Coordinate.new(x+1, y))
      end

      it "returns false for coordinate with different y value" do
        expect(coordinate).not_to eq(Coordinate.new(x, y+1))
      end
    end

    describe "#xy" do
      it "returns correct array of x, y" do
        expect(Coordinate.new(1, 2).xy).to eq([1, 2])
      end
    end
  end
end
