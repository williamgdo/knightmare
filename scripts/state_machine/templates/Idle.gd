extends State


@export var STAY_IDLE: bool = false


func on_enter_state():
	pass


func on_exit_state():
	pass


func on_process_update(_delta):
	animator.play("idle")


func on_physics_update(_delta):
	if STAY_IDLE:
		return
		
	if Global.player == null || Global.player.isDead():
		state_finished.emit(self, "wandering")
	else:
		var vector_to_player = Global.player.global_position - character.global_position
		
		if vector_to_player.length() < 300:
			state_finished.emit(self, "follow")
