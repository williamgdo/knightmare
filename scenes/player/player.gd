class_name Player
extends CharacterBody2D


@export var SPEED: float = 400.0
@export var ACCEL: float = 40

@onready var state_machine: PlayerStateMachine = $PlayerStateMachine

var direction

func _physics_process(delta):
	player_movement(delta)


func player_movement(delta):
	if state_machine.check_if_can_move():
		direction = Input.get_vector("left", "right", "up", "down")
	else:
		direction = Vector2.ZERO
	
	velocity = velocity.move_toward(direction * SPEED, ACCEL)

	move_and_slide()
