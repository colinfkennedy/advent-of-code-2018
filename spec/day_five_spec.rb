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
  end
end
