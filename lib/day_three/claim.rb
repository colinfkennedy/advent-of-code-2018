module DayThree
  class Claim

    #Matches claims in the form: #123 @ 3,2: 5x4
    CLAIM_REGEX = /#([0-9]+) @ ([0-9]+),([0-9]+): ([0-9]+)x([0-9]+)/

    attr_reader :id, :left_edge, :top_edge, :width, :height

    def initialize(data)
      matched = data.match(CLAIM_REGEX)
      @id = matched[1].to_i
      @left_edge = matched[2].to_i
      @top_edge = matched[3].to_i
      @width = matched[4].to_i
      @height = matched[5].to_i
    end
  end
end
