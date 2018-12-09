class DayOne

  def self.find_frequency(frequencies:)
    frequency = 0
    frequencies.each do |change|
      frequency += change
    end
    frequency
  end

  def self.find_repeating_frequency(frequencies:, frequency: 0, occurences: { 0 => 1})
    frequencies.each do |change|
      frequency += change
      return frequency if occurences[frequency] != nil
      occurences[frequency] = 1
    end

    find_repeating_frequency(frequencies: frequencies, frequency: frequency, occurences: occurences)
  end
end
