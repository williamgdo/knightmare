extends PlayerState

signal set_hitbox_monitoring(value: bool)

func on_enter_state():
#	player.velocity = player.velocity.move_toward(Vector2.ZERO * player.SPEED, player.ACCEL)
#	player.velocity = player.velocity.lerp(player.direction * player.SPEED, player.ACCEL)
	character.ACCEL = 20
	animator.play("attack-a")


func on_exit_state():
	character.ACCEL = 40


func on_physics_update(_delta):
	if animator.frame == 4:
		set_hitbox_monitoring.emit(true)


func _on_animated_sprite_2d_animation_finished():
	set_hitbox_monitoring.emit(false)
#	animator.stop()
	# https://ask.godotengine.org/135988/should-i-always-stop-an-animation-before-changing-to-new-one
	state_finished.emit(self, "idle")


#func _on_animated_sprite_2d_frame_changed():
#	var test = animator.get_parent().get_node("LightAttackHitbox")
#	print(str(test))
