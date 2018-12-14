require_relative "step"

module DaySeven
  class Instructions

    INSTRUCTION_REGEX = /Step ([A-Z]) must be finished before step ([A-Z]) can begin./

    attr_reader :steps

    def initialize(raw_instructions)
      @steps = {}
      process_raw_instructions(raw_instructions)
    end

    def step_order
      step_order = ""
      while uncompleted_steps > 0 do
        step_order += complete_next_step
      end
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
      steps[step_id] = ::DaySeven::Step.new(step_id) if steps[step_id].nil?
      steps[step_id]
    end

    private def uncompleted_steps
      steps.values.select { |step| !step.completed }.size
    end

    private def complete_next_step
      candidate_steps = steps.values.select { |step| step.uncompleted_dependencies.size == 0 && !step.completed }
      step_to_complete = candidate_steps.size == 1 ? candidate_steps[0] : candidate_steps.sort_by(&:id).first
      step_to_complete.complete
      step_to_complete.id
    end
  end
end
