require_relative "event"
require_relative "guard"

module DayFour
  class SleepChart
    attr_reader :events, :guards

    def initialize(events)
      @events = events.map { |event| DayFour::Event.new(event) }.sort_by(&:time)
      process_events
    end

    def most_sleepy_guard
      @sleepy_guard ||= guards.max_by{|id, guard| guard.sleep_duration}[1]
    end

    def guard_asleep_in_same_minute_the_most
      @guard_asleep_in_same_minute_the_most ||= guards.max_by{|id, guard| guard.most_asleep_minute_occurence}[1]
    end

    def strategy_1
      puts "Strategy 1 Guard: #{most_sleepy_guard.id}, Most asleep minute: #{most_sleepy_guard.most_asleep_minute}, Asleep duration #{most_sleepy_guard.sleep_duration}"
      most_sleepy_guard.id * most_sleepy_guard.most_asleep_minute
    end

    def strategy_2
      puts "Strategy 2 Guard: #{guard_asleep_in_same_minute_the_most.id}, Most asleep minute: #{guard_asleep_in_same_minute_the_most.most_asleep_minute}, Most asleep minute occurence: #{guard_asleep_in_same_minute_the_most.most_asleep_minute_occurence}"
      guard_asleep_in_same_minute_the_most.id * guard_asleep_in_same_minute_the_most.most_asleep_minute
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