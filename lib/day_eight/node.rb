module DayEight
  class Node
    attr_reader :children, :metadata

    def initialize(children:, metadata:)
      @children = children
      @metadata = metadata
    end

    def self.process_raw_input(raw_input)
      number_of_children = raw_input.shift
      number_of_metadata_entries = raw_input.shift
      children = []
      (0...number_of_children).each do |i|
        children.push(process_raw_input(raw_input))
      end
      Node.new(children: children, metadata: raw_input.shift(number_of_metadata_entries))
    end
  end
end
