require_relative "point"
require 'set'

module DaySix
  class Grid
    attr_reader :points, :max_x, :max_y

    def initialize(data)
      @points = data.each_with_index.map { |point, index| ::DaySix::Point.new(id: index, data: point) }
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
          coord_closest_point_tuple[coord] = get_closest_point(::DaySix::Point.new(id: "coordinate", data: coord))
        end
      end

      puts "Coord Closest Point: #{coord_closest_point_tuple}"

      points_area = coord_closest_point_tuple.values.inject(Hash.new(0)) do |total, point|
        total[point] += 1 unless point == -1
        total
      end

      puts "Points => Area: #{points_area}"

      non_infinite_points = remove_infinite_results(coord_closest_point_tuple: coord_closest_point_tuple, points_area: points_area)

      puts "Non infinite Points => Area: #{non_infinite_points}"

      max_area_point = non_infinite_points.max_by{|k,v| v}

      puts "Max Area Finite Point: #{max_area_point[0]} Area: #{max_area_point[1]}"
      max_area_point[1]
    end

    def part_2(max_distance: 10000)
      coord_total_distance_tuple = {}
      (0..max_x).each do |x|
        (0..max_y).each do |y|
          coord = "#{x}, #{y}"
          coord_total_distance_tuple[coord] = get_total_distance(::DaySix::Point.new(id: "coordinate", data: coord))
        end
      end

      points_area = coord_total_distance_tuple.values.inject(0) do |area, total_distance|
        area += 1 if total_distance < max_distance
        area
      end

      points_area
    end

    private def get_closest_point(coord)
      closest_points = []
      closest_distance = 1000000
      points.each do |point|
        distance = point.manhatten_distance(coord)
        if distance < closest_distance
          closest_distance = distance
          closest_points.clear
          closest_points.push(point)
        elsif distance == closest_distance
          closest_points.push(point)
        end
      end
        closest_points.size == 1 ? closest_points[0] : -1
    end

    private def remove_infinite_results(coord_closest_point_tuple:, points_area:)
      non_infinite_points = points_area.clone
      (0..max_x).each do |x|
        non_infinite_points.delete(coord_closest_point_tuple["#{x}, #{0}"])
        non_infinite_points.delete(coord_closest_point_tuple["#{x}, #{max_y}"])
      end

      (0..max_y).each do |y|
        non_infinite_points.delete(coord_closest_point_tuple["#{0}, #{y}"])
        non_infinite_points.delete(coord_closest_point_tuple["#{max_x}, #{y}"])
      end
      non_infinite_points
    end

    private def get_total_distance(coord)
      total_distance = 0
      points.each do |point|
        total_distance += point.manhatten_distance(coord)
      end
      total_distance
    end
  end
end
