require "day_four/event"
require "time"

describe ::DayFour::Event do
  let(:raw_event) { "#{time} #{message}" }
  let(:event) { ::DayFour::Event.new(raw_event) }

  shared_examples "creates an event with message" do
    it "instantiates a class with the correct timestamp" do
      expect(event).to be_instance_of(::DayFour::Event)
      expect(event.time).to eq(Time.parse(time))
    end

    it "instantiates a class with the correct message" do
      expect(event.message).to eq(message)
    end
  end

  context "with an input like [1518-09-16 23:57] Guard #1889 begins shift" do
    let(:time) { "[1518-09-16 23:57]" }
    let(:message) { "Guard #1889 begins shift" }

    include_examples "creates an event with message"

    it "has the guard id set" do
      expect(event.guard).to eq(1889)
    end
  end

  context "with an input like [1518-05-27 00:47] wakes up" do
    let(:time) { "[1518-05-27 00:47]" }
    let(:message) { "wakes up" }

    include_examples "creates an event with message"

    it "has no guard id set" do
      expect(event.guard).to be_nil
    end
  end

  context "with an input like [1518-09-26 00:48] falls asleep" do
    let(:time) { "[1518-09-26 00:48]" }
    let(:message) { "falls asleep" }

    include_examples "creates an event with message"
  end
end
