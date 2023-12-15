extends AttackTemplate

@export var dash_speed: int = 120

func on_enter_state():
	animator.play(attack_data.name)
	animator.animation_finished.connect(_on_animated_sprite_2d_animation_finished)
	
	# get direction for dash
	var character_position = character.get_node("FeetPosition").global_position
	var target_position = Global.player.get_node("FeetPosition").global_position
	character.face = (target_position - character_position).normalized()

	character.direction = target_position - character_position
	character.direction = character.direction + Vector2(character.face.x * 20, 0)


func on_physics_update(_delta):
	if animator.frame > active_frame_start && animator.frame < active_frame_end:
		hitbox._set_monitoring(true)
	else:
		hitbox._set_monitoring(false)
		
	character.dash(dash_speed, _delta)
