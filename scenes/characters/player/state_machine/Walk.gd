extends State

func on_process_update(_delta: float):
	if character.velocity.length() == 0:
		animator.stop()
		state_finished.emit(self, "idle")
	
	if Input.is_action_pressed("light-attack"):
		state_finished.emit(self, "attack_1")


func on_enter_state():
	animator.play("walk")
#	audio.play("walk")
