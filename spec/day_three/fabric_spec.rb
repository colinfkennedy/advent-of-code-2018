require "day_three/fabric"
require "day_three/claim"

describe ::DayThree::Fabric do
  let(:fabric) { ::DayThree::Fabric.new(claims) }

  describe "#overlapping_area" do
    context "with two claims that don't overlap" do
      let(:claim_1) { ::DayThree::Claim.new("#1 @ 0,0: 1x1") }
      let(:claim_2) { ::DayThree::Claim.new("#2 @ 1,1: 1x1") }
      let(:claims) { [claim_1, claim_2] }

      it "returns 0" do
        fabric.mark_out_claims
        expect(fabric.overlapping_area).to eq(0)
      end
    end

    context "with two claims that overlap one square" do
      let(:claim_1) { ::DayThree::Claim.new("#1 @ 0,0: 1x1") }
      let(:claim_2) { ::DayThree::Claim.new("#2 @ 0,0: 1x1") }
      let(:claims) { [claim_1, claim_2] }

      it "returns 1" do
        fabric.mark_out_claims
        expect(fabric.overlapping_area).to eq(1)
      end
    end

    context "with test input" do
      let(:claim_1) { ::DayThree::Claim.new("#1 @ 1,3: 4x4") }
      let(:claim_2) { ::DayThree::Claim.new("#2 @ 3,1: 4x4") }
      let(:claim_3) { ::DayThree::Claim.new("#3 @ 5,5: 2x2") }
      let(:claims) { [claim_1, claim_2, claim_3] }

      it "returns 4" do
        fabric.mark_out_claims
        expect(fabric.overlapping_area).to eq(4)
      end
    end
  end

  describe "non overlapping area" do
    context "with test input" do
      let(:claim_1) { ::DayThree::Claim.new("#1 @ 1,3: 4x4") }
      let(:claim_2) { ::DayThree::Claim.new("#2 @ 3,1: 4x4") }
      let(:claim_3) { ::DayThree::Claim.new("#3 @ 5,5: 2x2") }
      let(:claims) { [claim_1, claim_2, claim_3] }

      it "returns id 3" do
        fabric.mark_out_claims
        expect(fabric.non_overlapping_claims).to eq([3])
      end
    end
  end
end
