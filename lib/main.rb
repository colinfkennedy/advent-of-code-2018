require_relative "read"
# require_relative "day_one"
#
# puts "Day One"
#
# input_day_one = Read.get_input(filename: "input/day_one").map(&:to_i)
#
# frequency = DayOne.find_frequency(frequencies: input_day_one)
#
# puts "Frequency: #{frequency}"
#
# repeating_frequency = DayOne.find_repeating_frequency(frequencies: input_day_one)
#
# puts "Repeating frequency #{repeating_frequency}"
#
# puts ""
#
# require_relative "day_two"
#
# puts "Day Two"
#
# input_day_two = Read.get_input(filename: "input/day_two")
#
# checksum = DayTwo.find_checksum(input: input_day_two)
#
# puts "Checksum: #{checksum}"
#
# common_box_id = DayTwo.find_common_box_id(input: input_day_two)
#
# puts "Common box id: #{common_box_id}"
#
# require_relative "day_three/claim"
# require_relative "day_three/fabric"
#
# puts "Day Three"
#
# input_day_three = Read.get_input(filename: "input/day_three").map { |data| ::DayThree::Claim.new(data) }
#
# fabric = ::DayThree::Fabric.new(input_day_three)
#
# fabric.mark_out_claims
#
# puts "Overlap area: #{fabric.overlapping_area}"
#
# puts "Non overlap claim ids: #{fabric.non_overlapping_claims}"

# require_relative "day_four/sleep_chart"
#
# input_day_four = Read.get_input(filename: "input/day_four")
#
# sleep_chart = DayFour::SleepChart.new(input_day_four)
#
# puts "Strategy 1 Answer: #{sleep_chart.strategy_1}"
#
# puts "Strategy 2 Answer: #{sleep_chart.strategy_2}"
#
# require_relative "day_five"
#
# puts "Day Five"
#
# input_day_five = Read.get_input(filename: "input/day_five")[0]
#
# final_polymer_count = ::DayFive.new(input_day_five).polymer_units_count
#
# puts "Units: #{final_polymer_count}"
#
# efficient_polymer_count = ::DayFive.new(input_day_five).efficient_polymer_units_count
#
# puts "Efficient Polymer Units: #{efficient_polymer_count}"

require_relative "day_six/grid"

input_day_six = Read.get_input(filename: "input/day_six")

grid = ::DaySix::Grid.new(input_day_six)

puts "Largest finite area: #{grid.largest_finite_area}"
