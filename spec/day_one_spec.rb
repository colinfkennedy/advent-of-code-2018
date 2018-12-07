require "day_one"

describe DayOne do
  describe "#find_frequency" do
    context "with an input of 1 and 1" do
      it "returns 2" do
        expect(DayOne.find_frequency(frequencies: [1, 1])).to eq(2)
      end
    end

    context "with an input of 1 and -1" do
      it "returns 0" do
        expect(DayOne.find_frequency(frequencies: [1, -1])).to eq(0)
      end
    end

    context "with an input of 1 and -2 and 10" do
      it "returns 9" do
        expect(DayOne.find_frequency(frequencies: [1, -2, 10])).to eq(9)
      end
    end
  end

  describe "#find_repeating_frequency" do
    context "with an input of 1 and -1" do
      it "returns 0" do
        expect(DayOne.find_repeating_frequency(frequencies: [1, -1])).to eq(0)
      end
    end

    context "with an input of 1 and 1 and 2 and -2 and 8" do
      it "returns 2" do
        expect(DayOne.find_repeating_frequency(frequencies: [1, 1, 2, -2, 8])).to eq(2)
      end
    end

    context "with an input of +3, +3, +4, -2, -4" do
      it "returns 10" do
        expect(DayOne.find_repeating_frequency(frequencies: [+3, +3, +4, -2, -4])).to eq(10)
      end
    end

    context "with an input of -6, +3, +8, +5, -6" do
      it "returns 10" do
        expect(DayOne.find_repeating_frequency(frequencies: [-6, +3, +8, +5, -6])).to eq(5)
      end
    end

    context "with an input of +7, +7, -2, -7, -4" do
      it "returns 10" do
        expect(DayOne.find_repeating_frequency(frequencies: [+7, +7, -2, -7, -4])).to eq(14)
      end
    end
  end
end
