extends SlimeState

func on_process_update(_delta):
#	label.text = "%.2f %s %.2f" % [wander_time, is_waiting, timer.get_time_left()]
#	label.text = "%.2f %.2f %.2f" % [character.velocity.length(), character.velocity.x, character.velocity.y]
	
	if character.velocity.length() > 0:
		animator.play("walk")
	else:
		animator.play("idle")


func on_physics_update(_delta):
	if Global.player == null || Global.player.isDead():
		state_finished.emit(self, "wander")
		return 
	
	var player_feet_position = Vector2(Global.player.global_position.x, Global.player.global_position.y + 25)
	var vector_to_player = player_feet_position - character.global_position

	if vector_to_player.length() < 50:
		state_finished.emit(self, "attack")

	character.direction = vector_to_player.normalized()
	
	character.velocity = character.direction * character.SPEED 
	character.move_and_slide()
