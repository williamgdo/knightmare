extends State

func on_process_update(_delta):
	if character.velocity.length() > 0:
		animator.play("walk")
	else:
		animator.play("idle")


func on_physics_update(_delta):
	if Global.player == null || Global.player.isDead():
		state_finished.emit(self, "wandering")
		return 
	
	var vector_to_player = Global.player.global_position - character.global_position

	if vector_to_player.length() < 50:
		state_finished.emit(self, "attack-1")

	character.direction = vector_to_player.normalized()
	
	character.velocity = character.direction * character.SPEED 
	character.move_and_slide()
