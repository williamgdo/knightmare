extends State

signal set_hitbox_monitoring(value: bool)

func on_enter_state():
#	player.velocity = player.velocity.move_toward(Vector2.ZERO * player.SPEED, player.ACCEL)
#	player.velocity = player.velocity.lerp(player.direction * player.SPEED, player.ACCEL)
	character.ACCEL = 20
	animator.play("attack-1")


func on_exit_state():
	character.ACCEL = 40
	set_hitbox_monitoring.emit(false)


func on_physics_update(_delta):
	if animator.frame == 2:
		set_hitbox_monitoring.emit(true)
	elif animator.frame == 5:
		set_hitbox_monitoring.emit(false)


func _on_animated_sprite_2d_animation_finished():
	set_hitbox_monitoring.emit(false)
#	animator.stop()
	state_finished.emit(self, "idle")
