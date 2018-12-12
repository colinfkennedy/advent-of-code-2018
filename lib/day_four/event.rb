require 'time'

module DayFour

  TIME_AND_MESSAGE_REGEX = /(\[[0-9-:\s]+\])\s(.*)/
  GUARD_ID_REGEX = /#([0-9]+)/

  class Event
    attr_reader :time, :message, :guard

    def initialize(data)
      time_and_message = data.match(TIME_AND_MESSAGE_REGEX)
      @time = Time.parse(time_and_message[1])
      @message = time_and_message[2]
      @guard = data.match(GUARD_ID_REGEX)[1].to_i if data.match?(GUARD_ID_REGEX)
    end
  end
end
