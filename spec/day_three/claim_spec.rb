require "day_three/claim"

describe ::DayThree::Claim do
  context "with an input like #123 @ 3,2: 5x4" do
    let(:raw_claim) { "#123 @ 3,2: 5x4" }
    let(:claim) { ::DayThree::Claim.new(raw_claim) }

    it "instantiates a class with the correct fields" do
      expect(claim).to be_instance_of(::DayThree::Claim)
      expect(claim.id).to eq(123)
      expect(claim.left_edge).to eq(3)
      expect(claim.top_edge).to eq(2)
      expect(claim.width).to eq(5)
      expect(claim.height).to eq(4)
    end
  end
end
