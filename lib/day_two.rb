require_relative "read"

class DayTwo
  def self.find_checksum(input:)
    contains_2 = 0
    contains_3 = 0
    input.each do |box_number|
      contains_2 += 1 if contains_number_of_occurences?(box_number: box_number, number_of_occurences: 2)
      contains_3 += 1 if contains_number_of_occurences?(box_number: box_number, number_of_occurences: 3)
    end

    contains_2 * contains_3
  end

  def self.contains_number_of_occurences?(box_number:, number_of_occurences:)
    occurences = build_occurences_map(box_number)
    occurences.each_value do |value|
      return true if value == number_of_occurences
    end
    false
  end

  private_class_method def self.build_occurences_map(box_number)
    occurences = {}
    box_number.each_char do |char|
      if (occurences[char])
        occurences[char] += 1
      else
        occurences[char] = 1
      end
    end
    occurences
  end
end

input = Read.get_input(filename: "input/day_two")

checksum = DayTwo.find_checksum(input: input)

puts "Checksum: #{checksum}"
