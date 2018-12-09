require_relative "utility"

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

  def self.find_common_box_id(input:)
    input.combination(2).each do |box_id_1, box_id_2|
      next unless Utility.levenshtein(first: box_id_1, second: box_id_2) == 1
      puts "Box 1: #{box_id_1} Box 2: #{box_id_2}"
      answer = []
      box_id_1.split('').each_with_index do |value, index|
        answer.push(value) if value == box_id_2[index]
      end
      return answer.join
    end
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

