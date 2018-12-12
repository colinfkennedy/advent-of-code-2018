require "day_four/sleep_chart"

describe DayFour::SleepChart do
  let(:sleep_chart) { DayFour::SleepChart.new(events) }
  let(:event_1) { "[1518-11-01 00:00] Guard #10 begins shift"}
  let(:event_2) { "[1518-11-01 00:05] falls asleep"}
  let(:event_3) { "[1518-11-01 00:25] wakes up"}
  let(:event_4) { "[1518-11-01 00:30] falls asleep"}
  let(:event_5) { "[1518-11-01 00:55] wakes up"}

  let(:event_6) { "[1518-11-01 23:58] Guard #99 begins shift"}
  let(:event_7) { "[1518-11-02 00:40] falls asleep"}
  let(:event_8) { "[1518-11-02 00:50] wakes up"}

  let(:event_9) { "[1518-11-03 00:05] Guard #10 begins shift"}
  let(:event_10) { "[1518-11-03 00:24] falls asleep"}
  let(:event_11) { "[1518-11-03 00:29] wakes up"}

  let(:event_12) { "[1518-11-04 00:02] Guard #99 begins shift"}
  let(:event_13) { "[1518-11-04 00:36] falls asleep"}
  let(:event_14) { "[1518-11-04 00:46] wakes up"}

  let(:event_15) { "[1518-11-05 00:03] Guard #99 begins shift"}
  let(:event_16) { "[1518-11-05 00:45] falls asleep"}
  let(:event_17) { "[1518-11-05 00:55] wakes up"}

  let(:events) { [event_2, event_4, event_11, event_1, event_3, event_5, event_10, event_9, event_7, event_8, event_12, event_6, event_17, event_14, event_13, event_15, event_16] }

  it "does something" do
    puts "Events size: #{events.size}"
    puts "Sorted events: #{sleep_chart.events}"
  end
end