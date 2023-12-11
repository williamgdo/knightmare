extends State

signal set_hitbox_monitoring(value: bool)

@export var hitbox: Hitbox
@export var active_frame_start: int
@export var active_frame_end: int

#class Attack:
#	var name: String
#	var range_x: int
#
#	func _init(attack_name, attack_range):
#		name = attack_name
#		range_x = attack_range
#
#var attack_data = Attack.new("attack", 30) 

var attack_data = {
	"name": "attack", 
	"range_x": 50
}


func on_enter_state():
#	player.velocity = player.velocity.move_toward(Vector2.ZERO * player.SPEED, player.ACCEL)
#	player.velocity = player.velocity.lerp(player.direction * player.SPEED, player.ACCEL)
#	character.ACCEL = 20
#	animator.play("attack")
	animator.play(attack_data.name)
	animator.animation_finished.connect(_on_animated_sprite_2d_animation_finished)


func on_exit_state():
#	character.ACCEL = 40
	hitbox._set_monitoring(false)
	animator.animation_finished.disconnect(_on_animated_sprite_2d_animation_finished)
	


func on_physics_update(_delta):
	if animator.frame > active_frame_start && animator.frame < active_frame_end:
		hitbox._set_monitoring(true)
	else:
		hitbox._set_monitoring(false)
		


func _on_animated_sprite_2d_animation_finished():
	hitbox._set_monitoring(false)
#	animator.stop()
	state_finished.emit(self, "idle")
