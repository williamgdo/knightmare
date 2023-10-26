extends PlayerState

func on_process_update(_delta: float):
	if player.velocity.length() == 0:
		animator.stop()
		state_finished.emit(self, "idle")
	
	if player.velocity.length() > 0:
		if player.direction.x < 0:
			animator.flip_h = true
		elif player.direction.x > 0:
			animator.flip_h = false
			
	if Input.is_action_pressed("light-attack"):
		state_finished.emit(self, "attack")


func on_enter_state():
	animator.play("walk")
