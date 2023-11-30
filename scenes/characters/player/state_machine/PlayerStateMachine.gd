class_name PlayerStateMachine extends StateMachine

@export var character: CharacterBody2D
@export var animator: AnimatedSprite2D


func _ready():
	var params = { 
		"character" : character,
		"animator" : animator 
	}
	
	_map_children_states(params)
	_set_initial_state()
