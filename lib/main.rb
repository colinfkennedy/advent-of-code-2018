require_relative "day_one"
require_relative "day_two"
require_relative "read"

puts "Day One"

input_day_one = Read.get_input(filename: "input/day_one").map(&:to_i)

frequency = DayOne.find_frequency(frequencies: input_day_one)

puts "Frequency: #{frequency}"

repeating_frequency = DayOne.find_repeating_frequency(frequencies: input_day_one)

puts "Repeating frequency #{repeating_frequency}"

puts ""

puts "Day Two"

input_day_two = Read.get_input(filename: "input/day_two")

checksum = DayTwo.find_checksum(input: input_day_two)

puts "Checksum: #{checksum}"

common_box_id = DayTwo.find_common_box_id(input: input_day_two)

puts "Common box id: #{common_box_id}"