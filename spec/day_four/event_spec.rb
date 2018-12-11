require "day_four/event"

describe ::DayFour::Event do
  context "with an input like [1518-09-16 23:57] Guard #1889 begins shift" do
    let(:raw_event) { "[1518-09-16 23:57] Guard #1889 begins shift" }
    let(:event) { ::DayFour::Event.new(raw_event) }

    it "instantiates a class with the correct timestamp" do
      expect(event).to be_instance_of(::DayThree::Event)
      expect(event.time).to eq(1518-09-16 23:57)
    end
  end
end
