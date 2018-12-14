require "set"

module DaySeven
  class Step
    attr_reader :id, :dependencies, :completed

    def initialize(id)
      @id = id
      @dependencies = Set.new
      @completed = false
    end

    def add_dependency(step)
      dependencies.add(step)
    end

    def complete
      @completed = true
    end

    def uncompleted_dependencies
      dependencies.select { |step| !step.completed }
    end
  end
end
