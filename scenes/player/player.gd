class_name Player extends CharacterBody2D


@export var SPEED: float = 400.0
@export var ACCEL: float = 40


@onready var state_machine: PlayerStateMachine = $PlayerStateMachine
@onready var marker: Marker2D = $Marker2D

var direction


func _ready():
	Global.player = self


func _exit_tree():
	Global.player = null


func _process(_delta):
	if(direction.x > 0):
		marker.scale.x = 1
	elif(direction.x < 0):
		marker.scale.x = -1
#		https://ask.godotengine.org/64904/best-way-to-flip-character-and-all-of-its-collisions-areas-2d


func _physics_process(delta):
	player_movement(delta)


func player_movement(delta):
	if state_machine.check_if_can_move():
		direction = Input.get_vector("left", "right", "up", "down")
	else:
		direction = Vector2.ZERO
	
	velocity = velocity.move_toward(direction * SPEED, ACCEL)

	move_and_slide()


func isDead():
	return $HealthComponent.isDead
