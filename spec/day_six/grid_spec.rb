require "day_six/grid"

describe ::DaySix::Grid do
  let(:grid) { ::DaySix::Grid.new(raw_points)}

  describe "#largest_finite_area" do
    context "with test points" do
      let(:raw_points) { ["1, 1", "1, 6", "8, 3", "3, 4", "5, 5", "8, 9"] }

      it "returns 17" do
        expect(grid.largest_finite_area).to eq(17)
      end
    end
  end
end
