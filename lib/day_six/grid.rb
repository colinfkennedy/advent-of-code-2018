require_relative "point"

module DaySix
  class Grid
    attr_reader :points, :max_x, :max_y

    def initialize(data)
      @points = data.each.map { |point| ::DaySix::Point.new(point) }
      @max_x = points.max { |a, b| a.x <=> b.x }.x
      @max_y = points.max { |a, b| a.y <=> b.y }.y
    end

    def largest_finite_area
      puts "Max X #{max_x}"
      puts "Max Y #{max_y}"

      coord_closest_point_tuple = {}

      (0..max_x).each do |x|
        (0..max_y).each do |y|
          coord = "#{x}, #{y}"
          puts "Coord: #{coord}"
          coord_closest_point_tuple[coord] = get_closest_point(coord)
        end
      end
      puts coord_closest_point_tuple
    end

    private def get_closest_point(coord)
      closest_point = nil
      closest_distance = 1000000
      points.each do |point|
        distance = point.manhatten_distance(coord)
        if distance < closest_distance
          closest_distance = distance
          closest_point = point
        end
      end
      closest_point
    end
  end
end
