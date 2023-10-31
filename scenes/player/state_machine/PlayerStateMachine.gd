class_name PlayerStateMachine extends StateMachine

@export var player: CharacterBody2D
@export var animator: AnimatedSprite2D


func _ready():
	var params = { 
		"player" : player,
		"animator" : animator 
	}
	
	_map_children_states(params)
	_set_initial_state()
