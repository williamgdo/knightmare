extends State

@onready var despawn_timer: Timer = $DespawnTimer


func _on_health_component_died(_health_update: HealthUpdate):
	interrupt_state.emit("dead")


func on_enter_state():
	animator.play("dead")


func _on_animated_sprite_2d_animation_finished():
	if animator.animation == "dead":
		pass
#		despawn_timer.start()
#		var last_frame = animator.sprite_frames.get_frame_count("dead") - 1 
#		animator.set_frame_and_progress(last_frame, 1.0)


func _on_despawn_timer_timeout():
	start_blinking()


func start_blinking():
	var tween = create_tween().set_loops(3)
	
	tween.tween_property(animator, 'modulate', Color(1, 1, 1, 0), 0.15)
	tween.tween_property(animator, 'modulate', Color(1, 1, 1, 1), 0.15)
	tween.connect("finished", despawn)


func despawn():
#	self.owner.queue_free()
	print("despawn?")
