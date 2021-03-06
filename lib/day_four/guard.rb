module DayFour
  class Guard
    attr_reader :id, :days_asleep

    def initialize(id)
      @id = id
      @days_asleep = {}
    end

    def sleep(time)
      @current_sleep_time = time
    end

    def wake(time)
      date = "#{time.year}-#{time.month}-#{time.day}"
      days_asleep[date] = [] if days_asleep[date].nil?
      days_asleep[date].concat((@current_sleep_time.min...time.min).to_a)
    end

    def sleep_duration
      total_sleep = 0
      days_asleep.values.each do |day|
        total_sleep += day.length
      end
      total_sleep
    end

    def most_asleep_minute
      return nil if max_minute_frequency_tuple.nil?
      max_minute_frequency_tuple[0]
    end

    def most_asleep_minute_occurence
      return 0 if max_minute_frequency_tuple.nil?
      max_minute_frequency_tuple[1]
    end

    private def max_minute_frequency_tuple
      @max_minute_frequency_tuple ||= day_sleep_frequency.max_by {|k, v| v}
    end

    private def day_sleep_frequency
      @day_sleep_frequency ||= begin
        day_sleep_frequency = {}
        days_asleep.values.each do |day|
          day.each do |minute|
            day_sleep_frequency[minute] = 0 if day_sleep_frequency[minute].nil?
            day_sleep_frequency[minute] += 1
          end
        end
        day_sleep_frequency
      end
    end

  end
end