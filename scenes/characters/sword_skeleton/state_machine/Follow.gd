extends State

func on_process_update(_delta):
#	label.text = "%.2f %s %.2f" % [wander_time, is_waiting, timer.get_time_left()]
#	label.text = "%.2f %.2f %.2f" % [character.velocity.length(), character.velocity.x, character.velocity.y]
	
	if character.velocity.length() > 0:
		animator.play("walk")
	else:
		animator.play("idle")

var last_vector_to_player 

func on_physics_update(_delta):
	if Global.player == null || Global.player.isDead():
		state_finished.emit(self, "wandering")
		return 
	
	var vector_to_player = Global.player.get_node("FeetPosition").global_position - character.get_node("FeetPosition").global_position
	last_vector_to_player = vector_to_player
	
	# TODO: the 50 and 30 values should NOT be static. It should scale with Hitbox's CollisionShape size.
	if abs(vector_to_player.x) < 50 && abs(vector_to_player.y) < Global.Z_INDEX_RANGE - 1:
		state_finished.emit(self, "attack")
	
	character.direction = vector_to_player.normalized()
	
	if vector_to_player.x < 0:
		vector_to_player.x += 30
	else:
		vector_to_player.x -= 30
		
	character.velocity = vector_to_player.normalized() * character.SPEED 
	character.move_and_slide()
