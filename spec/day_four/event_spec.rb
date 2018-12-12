require "day_four/event"
require "time"

describe ::DayFour::Event do
  context "with an input like [1518-09-16 23:57] Guard #1889 begins shift" do
    let(:raw_event) { "[1518-09-16 23:57] Guard #1889 begins shift" }
    let(:event) { ::DayFour::Event.new(raw_event) }

    it "instantiates a class with the correct timestamp" do
      expect(event).to be_instance_of(::DayFour::Event)
      expect(event.time).to eq(Time.parse("1518-09-16 23:57"))
      expect(event.message).to eq("Guard #1889 begins shift")
      expect(event.guard).to eq(1889)
    end

    it "is begin shift event" do
      expect(event.is_begin_shift?).to eq(true)
    end

    it "is not fall asleep" do
      expect(event.is_fall_asleep?).to eq(false)
    end

    it "is not wakes up" do
      expect(event.is_wakes_up?).to eq(false)
    end
  end

  context "with an input like [1518-09-16 23:57] falls asleep" do
    let(:raw_event) { "[1518-09-26 00:48] falls asleep" }
    let(:event) { ::DayFour::Event.new(raw_event) }

    it "is not begin shift event" do
      expect(event.is_begin_shift?).to eq(false)
    end

    it "is not wakes up" do
      expect(event.is_wakes_up?).to eq(false)
    end

    it "is fall asleep" do
      expect(event.is_fall_asleep?).to eq(true)
    end
  end

  context "with an input like [1518-07-16 00:43] wakes up" do
    let(:raw_event) { "[1518-07-16 00:43] wakes up" }
    let(:event) { ::DayFour::Event.new(raw_event) }

    it "is not begin shift event" do
      expect(event.is_begin_shift?).to eq(false)
    end

    it "is not fall asleep" do
      expect(event.is_fall_asleep?).to eq(false)
    end

    it "is wakes up" do
      expect(event.is_wakes_up?).to eq(true)
    end
  end
end
