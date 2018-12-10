module DayThree
  class Fabric

    attr_reader :claims, :fabric, :overlapping_area

    def initialize(claims)
      @claims = claims
      @fabric = Array.new(1000) { Array.new(1000) }
      @overlapping_area = 0
    end

    def overlap_area
      claims.each do |claim|
        (claim.left_edge..claim.left_edge + claim.width - 1).each do |column|
          (claim.top_edge..claim.top_edge + claim.height - 1).each do |row|
            claim_square(column: column, row: row)
          end
        end
      end
      overlapping_area
    end

    private def claim_square(column:, row:)
      square = fabric[column][row]
      if square.nil?
        fabric[column][row] = "taken"
      elsif square == "taken"
        @overlapping_area += 1
        fabric[column][row] = "taken_more_than_once"
      end
    end

  end
end
