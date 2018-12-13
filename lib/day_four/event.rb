require "time"

module DayFour
  class Event
    attr_reader :time, :message, :guard

    TIME_AND_MESSAGE_REGEX = /\[([0-9-:\s]+)\]\s(.*)/
    GUARD_ID_REGEX = /#([0-9]+)/

    def initialize(data)
      time_and_message = data.match(TIME_AND_MESSAGE_REGEX)
      @time = Time.parse(time_and_message[1])
      @message = time_and_message[2]
      @guard = data.match(GUARD_ID_REGEX)[1].to_i if data.match?(GUARD_ID_REGEX)
    end

    def is_begin_shift?
      @message == "Guard ##{guard} begins shift"
    end

    def is_fall_asleep?
      @message == "falls asleep"
    end

    def is_wakes_up?
      @message == "wakes up"
    end
  end
end
