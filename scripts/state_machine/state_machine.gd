class_name StateMachine extends Node


@export var initial_state: State


var states: Dictionary = {}
var current_state: State


func _ready():
	_map_children_states()
	_set_initial_state()


func _map_children_states(args: Dictionary = {}):
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_finished.connect(handle_change_state)
			child.interrupt_state.connect(on_interrupt_state)

			if args.is_empty() == false:
				for key in args.keys():
					child.set(key, args[key])
		else:
			push_warning("Child " + child.name + " is not State for StateMachine")


func _set_initial_state():
	if initial_state:
		initial_state.on_enter_state()
		current_state = initial_state


func _process(delta):
	if current_state:
		current_state.on_process_update(delta)


func _physics_process(delta):
	if current_state:
		current_state.on_physics_update(delta)


func check_if_can_move():
	return current_state.can_move


func handle_change_state(state, new_state_name: String):
	if state != current_state:
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return
	
	if current_state:
		current_state.on_exit_state()
		
	new_state.on_enter_state()
	
	current_state = new_state


func on_interrupt_state(new_state_name: String):
	handle_change_state(current_state, new_state_name)
