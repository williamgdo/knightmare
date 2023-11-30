class_name SpearSkelStateMachine extends StateMachine

@export var character: CharacterBody2D
@export var animator: AnimatedSprite2D
@export var label: Label


func _ready():
	var params = {
		"character": character,
		"animator": animator,
		"label": label,
	}
	
	_map_children_states(params)
	_set_initial_state()
