require 'set'

module DayThree
  class Fabric

    attr_reader :claims, :fabric, :overlapping_area

    def initialize(claims)
      @claims = claims
      @fabric = Array.new(1000) { Array.new(1000) { [] } }
      @overlapping_area = 0
    end

    def mark_out_claims
      claims.each do |claim|
        (claim.left_edge..claim.left_edge + claim.width - 1).each do |column|
          (claim.top_edge..claim.top_edge + claim.height - 1).each do |row|
            claim_square(column: column, row: row, claim_id: claim.id)
          end
        end
      end
    end

    def non_overlapping_claims
      good_claims = Set.new
      bad_claims = Set.new
      fabric.each do |x|
        x.each do |y|
          next if y.empty?
          if y.length == 1
            good_claims.add(y[0])
          else
            y.each do |id|
              bad_claims.add(id)
            end
          end
        end
      end
      (good_claims - bad_claims).to_a
    end

    private def claim_square(column:, row:, claim_id:)
      square = fabric[column][row]
      if square.length == 1
        @overlapping_area += 1
      end
      fabric[column][row].push(claim_id)
    end

  end
end
