require_relative "step"

module DaySeven
  class Instructions

    INSTRUCTION_REGEX = /Step ([A-Z]) must be finished before step ([A-Z]) can begin./

    attr_reader :steps, :total_duration

    def initialize(raw_instructions:, elves: 1, extra_duration: 0)
      @steps = {}
      @elves = elves
      @extra_duration = extra_duration
      process_raw_instructions(raw_instructions)
    end

    def step_order
      duration = 0
      step_order = ""
      while uncompleted_steps > 0 do
        duration += 1
        step_order +=  complete_next_step.join
      end
      @total_duration = duration
      step_order
    end

    private def process_raw_instructions(raw_instructions)
      raw_instructions.each do |instruction|
        matched_instruction = instruction.match(INSTRUCTION_REGEX)
        step_id = matched_instruction[2]
        dependency_step_id = matched_instruction[1]
        step = get_or_create_step(step_id)
        step.add_dependency(get_or_create_step(dependency_step_id))
      end
    end

    private def get_or_create_step(step_id)
      steps[step_id] = ::DaySeven::Step.new(id: step_id, extra_duration: @extra_duration) if steps[step_id].nil?
      steps[step_id]
    end

    private def uncompleted_steps
      steps.values.select { |step| !step.completed }.size
    end

    private def complete_next_step
      candidate_steps = steps.values.select { |step| step.uncompleted_dependencies.size == 0 && !step.completed }
      steps_to_complete = candidate_steps.sort_by(&:id).take(@elves)
      completed_steps = []
      steps_to_complete.each do |step_to_complete|
        step_to_complete.complete
        completed_steps.push(step_to_complete.id) if step_to_complete.completed
      end
      completed_steps
    end
  end
end
