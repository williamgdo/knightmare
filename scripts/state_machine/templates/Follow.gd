extends State

func on_physics_update(delta):
	var character_pos = character.get_node("FeetPosition").global_position
	var target_pos = Global.player.get_node("FeetPosition").global_position
	var vector_to_target = target_pos - character_pos
	
	if character_pos.distance_to(target_pos) < 100:
		state_finished.emit(self, "preattack")
	else:
		character.direction = vector_to_target
		character.face = vector_to_target.normalized()
	
	character.move_character(delta)


