require_relative "event"
require_relative "guard"

module DayFour
  class SleepChart
    attr_reader :events, :guards

    def initialize(events)
      @events = events.map { |event| DayFour::Event.new(event) }.sort_by(&:time)
      process_events
    end

    def sleepy_guard
      @sleepy_guard ||= guards.max_by{|id, guard| guard.sleep_duration}[1]
    end

    def guard_minute_product
      puts "Guard: #{sleepy_guard.id}, Most asleep minute: #{sleepy_guard.most_asleep_minute}"
      sleepy_guard.id * sleepy_guard.most_asleep_minute
    end

    private def process_events
      @guards = {}
      current_guard = nil
      sleep_start_minute = 0
      @events.each do |event|
        if event.is_begin_shift?
          @guards[event.guard] = DayFour::Guard.new(event.guard) if @guards[event.guard].nil?
          current_guard = @guards[event.guard]
        elsif event.is_fall_asleep?
          current_guard.sleep(event.time)
        elsif event.is_wakes_up?
          current_guard.wake(event.time)
        end
      end
    end
  end
end