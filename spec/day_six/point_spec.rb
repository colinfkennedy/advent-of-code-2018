require "day_six/point"

describe ::DaySix::Point do
  let(:point) { ::DaySix::Point.new(raw_point)}

  context "with a point 0, 0" do
    let(:raw_point) { "0, 0" }

    it "has an x coord of 0" do
      expect(point.x).to eq(0)
    end

    it "has a y coord of 0" do
      expect(point.y).to eq(0)
    end
  end

  context "with a point 1, 1" do
    let(:raw_point) { "1, 1" }

    it "has an x coord of 1" do
      expect(point.x).to eq(1)
    end

    it "has a y coord of 1" do
      expect(point.y).to eq(1)
    end

    context "and another point 0, 0" do
      let(:other_point) { ::DaySix::Point.new("0, 0") }

      it "has a manhatten distance of 1 to it" do
        expect(point.manhatten_distance(other_point)).to eq(2)
      end
    end

    context "and another point 10, 100" do
      let(:other_point) { ::DaySix::Point.new("10, 100") }

      it "has a manhatten distance of 1 to it" do
        expect(point.manhatten_distance(other_point)).to eq(108)
      end
    end
  end
end
