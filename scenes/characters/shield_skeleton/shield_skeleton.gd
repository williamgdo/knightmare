extends CharacterBody2D


@export var max_speed: float = 50
@export var acceleration: float = 5000
@export var friction: float = 1500
@export var points_reward: int = 100
@export var target: Player

@onready var animator = $Marker2D/AnimatedSprite2D
@onready var marker: Marker2D = $Marker2D
@onready var state_machine = $StateMachine
@onready var debug_label = $Label


# the direction where the character will walk
var direction: Vector2
# the direction the character will face
var face: Vector2


func _ready():
	Global.check_default_nodes(self)
	
	if target != null:
		target.get_node("HealthComponent").died.connect(_on_target_died)


func _on_target_died(_health_update):
	state_machine._handle_change_state(state_machine.current_state, "wander")


func _process(_delta):
	if(face.x > 0):
		marker.scale.x = 1
	elif(face.x < 0):
		marker.scale.x = -1
	
	debug_label.text = state_machine.current_state.name
	
	if state_machine.current_state.can_move == false:
		return
	
	if velocity.length() > 0:
		animator.play("walk")
	else:
		animator.play("idle")


func move_character(delta):
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


func dash(dash_speed, delta):
	if direction == Vector2.ZERO:
		apply_friction(friction * delta)
	else:
		velocity += direction * acceleration * delta
		velocity = velocity.limit_length(dash_speed)
	move_and_slide()
