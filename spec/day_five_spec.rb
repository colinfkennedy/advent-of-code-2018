require "day_five"

describe DayFive do
  describe "#polymer_units_count" do
    let(:day_five) { DayFive.new(polymer)}


    context "with aA polymer" do
      let(:polymer) { "aA" }

      it "returns zero" do
        expect(day_five.polymer_units_count).to eq(0)
      end
    end

    context "with abBA polymer" do
      let(:polymer) { "abBA" }

      it "returns zero" do
        expect(day_five.polymer_units_count).to eq(0)
      end
    end

    context "with abAB polymer" do
      let(:polymer) { "abAB" }

      it "returns 4" do
        expect(day_five.polymer_units_count).to eq(4)
      end
    end

    context "with aabAAB polymer" do
      let(:polymer) { "aabAAB" }

      it "returns 6" do
        expect(day_five.polymer_units_count).to eq(6)
      end
    end

    context "with dabAcCaCBAcCcaDA polymer" do
      let(:polymer) { "dabAcCaCBAcCcaDA" }

      it "returns 10" do
        expect(day_five.polymer_units_count).to eq(10)
      end

      it "returns 4 for efficient polymer" do
        expect(day_five.efficient_polymer_units_count).to eq(4)
      end
    end
  end
end
