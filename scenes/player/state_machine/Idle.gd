extends PlayerState


func on_process_update(_delta: float):
	if character.velocity.length() > 0:
		animator.stop()
		state_finished.emit(self, "walk")
	
	if Input.is_action_pressed("light-attack"):
		state_finished.emit(self, "attack")


func on_enter_state():
	animator.play("idle")
