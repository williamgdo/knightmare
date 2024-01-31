class_name AttackTemplate extends State

signal set_hitbox_monitoring(value: bool)

@export var hitbox: Hitbox
@export var active_frame_start: int
@export var active_frame_end: int
@export var attack_name: String = "attack"
@export var range_x: int = 50

@export var attack_sfx: AudioStream
@onready var sound = $AttackSound


var attack_data

func _ready():
	can_move = false
	
	if hitbox == null:
		push_error("hitbox from %s@%s is not defined." % [self.name, owner.name])
	
	assert(attack_sfx != null, "attack_sound from %s@%s is not defined." % [self.name, owner.name])
	sound.stream = attack_sfx
		
	attack_data = {
		"name": attack_name, 
		"range_x": range_x
	}


func on_enter_state():
#	player.velocity = player.velocity.move_toward(Vector2.ZERO * player.SPEED, player.ACCEL)
#	player.velocity = player.velocity.lerp(player.direction * player.SPEED, player.ACCEL)
#	character.ACCEL = 20
#	animator.play("attack")
	animator.play(attack_data.name)
	animator.animation_finished.connect(_on_animated_sprite_2d_animation_finished)
	sound.play()


func on_exit_state():
#	character.ACCEL = 40
	hitbox._set_monitoring(false)
	animator.animation_finished.disconnect(_on_animated_sprite_2d_animation_finished)
	sound.stop()
	


func on_physics_update(_delta):
	if animator.frame > active_frame_start && animator.frame < active_frame_end:
		hitbox._set_monitoring(true)
	else:
		hitbox._set_monitoring(false)
		


func _on_animated_sprite_2d_animation_finished():
	hitbox._set_monitoring(false)
#	animator.stop()
	state_finished.emit(self, "idle")
