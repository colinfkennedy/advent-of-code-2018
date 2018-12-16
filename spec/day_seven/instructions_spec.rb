require "day_seven/instructions"

describe ::DaySeven::Instructions do
  let(:raw_instructions) do
    [
      "Step C must be finished before step A can begin.",
      "Step C must be finished before step F can begin.",
      "Step A must be finished before step B can begin.",
      "Step A must be finished before step D can begin.",
      "Step B must be finished before step E can begin.",
      "Step D must be finished before step E can begin.",
      "Step F must be finished before step E can begin."
    ]
  end
  let(:elves) { 1 }
  let(:extra_duration) { 0 }
  let(:instructions) {described_class.new(raw_instructions: raw_instructions, elves: elves, extra_duration: extra_duration)}

  describe "#step_order" do
    it "returns CABDFE" do
      expect(instructions.step_order).to eq("CABDFE")
    end
  end

  describe "#total_duration" do
    let(:elves) { 2 }

    before do
      instructions.step_order
    end

    it "returns 15" do
      expect(instructions.total_duration).to eq(15)
    end

    context "with extra duration is 60" do
      let(:extra_duration) { 60 }

      it "returns 255" do
        expect(instructions.total_duration).to eq(255)
      end
    end
  end
end
