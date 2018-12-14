require "day_seven/step"

describe ::DaySeven::Step do
  let(:id) { "A" }
  let(:step) { described_class.new(id) }

  it "creates a step with the correct id" do
    expect(step.id).to eq(id)
  end

  it "sets the step duration to 1" do
    expect(step.duration).to eq(1)
  end

  context "with a step id of Z" do
    let(:id) { "Z" }

    it "sets the step duration to 26" do
      expect(step.duration).to eq(26)
    end
  end

  describe "#add_dependency" do
    let(:step_b) { described_class.new("B") }
    let(:uncompleted_dependencies) { step.uncompleted_dependencies.to_a }

    it "adds a dependency to the list" do
      step.add_dependency(step_b)
      expect(uncompleted_dependencies.size).to eq(1)
      expect(uncompleted_dependencies[0]).to eq(step_b)
    end

    context "with multiple dependencies" do
      let(:step_c) { described_class.new("C") }

      it "shows them all in the uncompleted_dependencies list" do
        step.add_dependency(step_b)
        step.add_dependency(step_c)
        expect(uncompleted_dependencies.size).to eq(2)
        expect(uncompleted_dependencies[0]).to eq(step_b)
        expect(uncompleted_dependencies[1]).to eq(step_c)
      end

      context "with a completed dependency" do
        it "does not show it in the uncompleted_dependencies list" do
          step.add_dependency(step_b)
          step.add_dependency(step_c)
          step_b.complete
          step_b.complete
          expect(uncompleted_dependencies.size).to eq(1)
          expect(uncompleted_dependencies[0]).to eq(step_c)
        end
      end

    end

    context "when adding the same dependency twice" do
      let(:step_c) { described_class.new("C") }

      it "only adds one step to the list" do
        step.add_dependency(step_b)
        step.add_dependency(step_b)
        expect(uncompleted_dependencies.size).to eq(1)
        expect(uncompleted_dependencies[0]).to eq(step_b)
      end
    end
  end

  describe "#complete" do
    it "returns false for completed initially" do
      expect(step.completed).to eq(false)
    end

    it "returns true for completed when it matches the duration" do
      step.complete
      expect(step.completed).to eq(true)
    end

    context "with an id of E" do
      let(:id) { "E" }

      it "returns true for completed when it matches the duration" do
        step.complete
        expect(step.completed).to eq(false)
        step.complete
        expect(step.completed).to eq(false)
        step.complete
        expect(step.completed).to eq(false)
        step.complete
        expect(step.completed).to eq(false)
        step.complete
        expect(step.completed).to eq(true)
      end
    end
  end
end
