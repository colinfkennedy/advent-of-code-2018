require "set"

module DaySeven
  class Step
    attr_reader :id, :dependencies, :completed, :duration, :current_progress

    ALPHABET = ("A".."Z").to_a

    def initialize(id)
      @id = id
      @dependencies = Set.new
      @completed = false
      @duration = ALPHABET.index(id) + 1
      @current_progress = 0
    end

    def add_dependency(step)
      dependencies.add(step)
    end

    def complete
      @current_progress += 1
      @completed = true if current_progress == duration
    end

    def uncompleted_dependencies
      dependencies.select { |step| !step.completed }
    end
  end
end
