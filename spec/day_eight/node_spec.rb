require "day_eight/node"

describe ::DayEight::Node do
  let(:raw_input) { [2, 3, 0, 3, 10, 11, 12, 1, 1, 0, 1, 99, 2, 1, 1, 2] }
  let(:node) { described_class.process_raw_input(raw_input) }

  it "has 2 children and 3 metadata entries" do
    expect(node.children.size).to eq(2)
    expect(node.metadata.size).to eq(3)
    expect(node.metadata[0]).to eq(1)
    expect(node.metadata[1]).to eq(1)
    expect(node.metadata[2]).to eq(2)
  end

  it "has a metadata sum of 138" do
    expect(node.all_metadata_sum).to eq(138)
  end
end
