require 'set'

class DayFive
  attr_reader :polymer, :final_polymer

  def initialize(polymer)
    @polymer = polymer.strip
    @final_polymer = react
  end

  def polymer_units_count
    final_polymer.length
  end

  def efficient_polymer_units_count
    units_to_skip = Set.new(polymer.split('').map(&:downcase))
    reacted_polymer_sizes = []
    units_to_skip.each do |unit|
      reacted_polymer_sizes << react(unit_to_skip: unit).size
    end
    reacted_polymer_sizes.min
  end

  private def react(unit_to_skip: nil)
    units = polymer.split('')
    final_polymer = []
    units.each do |unit|
      next if unit.downcase == unit_to_skip

      if final_polymer.empty?
        final_polymer << unit
      else
        previous = final_polymer.last
        if unit.swapcase == previous
          final_polymer.pop
        else
          final_polymer << unit
        end
      end
    end
    final_polymer
  end
end
