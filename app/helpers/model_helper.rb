module ModelHelper
  def human_attribute_name(model, attribute)
    model.to_s.classify.constantize.human_attribute_name(attribute)
  end

  def human_event_name(model, event, state_machine = :state)
    events = model.to_s.classify.constantize \
      .state_machines[state_machine] \
      .events
    events[event].human_name
  rescue
    raise "event '#{event}' does not found in '#{state_machine}' for '#{model}'"
  end

  def human_model_name(model, args = {})
    model_class = model.try(:to_class) || model
    model_class.try(:model_name).try(:human, args) || model.to_s
  end

  def model_states(model, state_machine = :state)
    model.to_s.classify.constantize \
      .state_machines[state_machine] \
      .states
  end

  def human_state_names(model, state_machine = :state)
    model_states(model, state_machine).map(&:human_name)
  end

  def human_state_name(model, state, state_machine = :state)
    model_states(model, state_machine)[state].human_name
  end
end
