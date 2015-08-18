require "spec_helper"

module Sokoban
  RSpec.describe Level do
    let(:level) { Level.new(" @ ") }

    describe "grid" do
      let(:grid) { level.grid }

      it "populates cells with elements" do
        row = grid[0]
        expected = [Elements::Space, Elements::Person, Elements::Space]
        row.each_with_index do |cell, index|
          expect(cell.elements.size).to eq(1)
          expect(cell.elements.first).to be_a(expected[index])
        end
      end
    end

    describe "#person_cell" do
      it "returns correct cell" do
        expect(level.person_cell.xy).to eq([0, 1])
      end
    end

    describe "#cell_to_left" do
      it "returns correct cell" do
        person_cell = level.person_cell
        expect(level.cell_to_left(person_cell).xy).to eq([0, 0])
      end
    end
  end
end
