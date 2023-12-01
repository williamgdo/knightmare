class_name Player extends CharacterBody2D


@export var max_speed: float = 250
@export var acceleration: float = 5000
@export var friction: float = 1500


@onready var state_machine: PlayerStateMachine = $PlayerStateMachine
@onready var marker: Marker2D = $Marker2D
@onready var direction = Vector2.ZERO


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
	get_direction()
	move_player(delta)


func get_direction():
	if state_machine.check_if_can_move():
		direction = Input.get_vector("left", "right", "up", "down")
	else:
		direction = Vector2.ZERO


func move_player(delta):
	if direction == Vector2.ZERO:
		apply_friction(friction * delta)
	else:
		apply_movement(direction * acceleration * delta)
	move_and_slide()


func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO


func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(max_speed)


func isDead():
	return $HealthComponent.isDead
