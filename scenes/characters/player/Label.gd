extends Label

@export var state_machine: PlayerStateMachine

func _process(_delta):
	text = "Pos: " + str(state_machine.get_parent().global_position)
