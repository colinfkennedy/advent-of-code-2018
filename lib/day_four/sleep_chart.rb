require "day_four/event"

module DayFour
  class SleepChart
    attr_reader :events

    def initialize(events)
      @events = events.map { |event| DayFour::Event.new(event) }.sort_by(&:time)
    end
  end
end