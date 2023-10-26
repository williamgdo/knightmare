extends PlayerState


func on_enter_state():
#	player.velocity = player.velocity.move_toward(Vector2.ZERO * player.SPEED, player.ACCEL)
#	player.velocity = player.velocity.lerp(player.direction * player.SPEED, player.ACCEL)
	player.ACCEL = 20
	animator.play("attack-a")


func on_exit_state():
	player.ACCEL = 40

#func on_physics_update(_delta):
#	player.velocity = player.velocity.lerp(player.direction * player.SPEED, player.ACCEL * _delta)


func _on_animated_sprite_2d_animation_finished():
	animator.stop()
	state_finished.emit(self, "idle")
