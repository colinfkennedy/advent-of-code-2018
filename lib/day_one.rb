require_relative "read"

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

input = Read.get_input(filename: "input/day_one").map(&:to_i)

frequency = DayOne.find_frequency(frequencies: input)

puts "Frequency: #{frequency}"

repeating_frequency = DayOne.find_repeating_frequency(frequencies: input)

puts "Repeating frequency #{repeating_frequency}"
