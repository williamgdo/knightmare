extends State

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
	
	
