require "spec_helper"

module Sokoban
  RSpec.describe Level do
    let(:grid) { level.grid }

    describe "single-line level" do
      let(:level) { single_line_level }

      describe "grid" do
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

    describe "multi-line level" do
      let(:level) { multi_line_level }

      describe "grid" do
        it "populates rows with space elements" do
          space_rows_indexes = [0,2]
          space_rows_indexes.each do |index|
            row = grid[index]
            expect(row.size).to eq(3)
            elements = row.collect { |cell| cell.elements.first }
            elements.each { |elem| expect(elem).to be_a(Elements::Space) }
          end
        end

        it "populates row with space and person elements" do
          row = grid[1]
          expected = [Elements::Space, Elements::Person, Elements::Space]
          row.each_with_index do |cell, index|
            expect(cell.elements.size).to eq(1)
            expect(cell.elements.first).to be_a(expected[index])
          end
        end
      end
    end
  end
end
