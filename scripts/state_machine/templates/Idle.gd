extends State


@export var stay_idle: bool = false
@export var range_to_follow: int = 300


func on_enter_state():
	character.direction = Vector2.ZERO
	character.velocity = Vector2.ZERO


func on_process_update(_delta):
#	animator.play("idle")
	pass


func on_physics_update(_delta):
	if stay_idle:
		return
		
	if Global.player == null || Global.player.isDead():
		state_finished.emit(self, "wander")
	else:
		var vector_to_player = Global.player.global_position - character.global_position
		
		if vector_to_player.length() < range_to_follow:
			state_finished.emit(self, "follow")
