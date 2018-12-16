module DayEight
  class Node
    attr_reader :children, :metadata

    def initialize(raw_input)
      @children = []
      @metadata = []
    end
  end
end