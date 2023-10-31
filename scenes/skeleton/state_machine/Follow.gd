extends SkeletonState

@export var target: CharacterBody2D

#func on_enter_state():

func on_process_update(_delta):
#	label.text = "%.2f %s %.2f" % [wander_time, is_waiting, timer.get_time_left()]
#	label.text = "%.2f %.2f %.2f" % [character.velocity.length(), character.velocity.x, character.velocity.y]
	
	if character.velocity.length() > 0:
		animator.play("walk")
	else:
		animator.play("idle")


func on_physics_update(_delta):
	if !target:
		return 
	
	var direction = target.global_position - character.global_position
	
	if direction.length() > 25:
		character.velocity = direction.normalized() * character.SPEED
	else:
		character.velocity = Vector2.ZERO
