module DaySix
  class Point
    attr_reader :id, :x, :y

    def initialize(id:, data:)
      @id = id
      coords = data.split(',')
      @x = coords[0].to_i
      @y = coords[1].to_i
    end

    def manhatten_distance(other_point)
      (self.x - other_point.x).abs + (self.y - other_point.y).abs
    end
  end
end
