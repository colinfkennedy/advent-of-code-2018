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
  let(:instructions) {described_class.new(raw_instructions)}

  describe "#step_order" do
    it "returns CABDFE" do
      expect(instructions.step_order).to eq("CABDFE")
    end
  end

  describe "#total_duration" do
    it "returns 15" do
      expect(instructions.total_duration(elves: 2, step_duration: 0)).to eq(15)
    end
  end
end
