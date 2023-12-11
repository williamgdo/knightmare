extends State


@onready var despawn_timer: Timer = $DespawnTimer

@export var health_component: health_component
@export var animated_sprite: AnimatedSprite2D


func _ready():
	can_move = false
	
	if health_component == null:
		push_error("health_component from %s@%s is not defined." % [self.name, owner.name])
	else:
		health_component.died.connect(_on_health_component_died)
		
	if animated_sprite == null:
		push_error("animated_sprite from %s@%s is not defined." % [self.name, owner.name])
	else:
		animated_sprite.animation_finished.connect(_on_animated_sprite_2d_animation_finished)


func on_enter_state():
	animator.play("dead")
	
	if character.points_reward != null:
		Global.score += character.points_reward


func _on_health_component_died(_health_update: HealthUpdate):
	interrupt_state.emit("dead")
	

func _on_animated_sprite_2d_animation_finished():
	if animator.animation == "dead":
		despawn_timer.start()
		
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
	self.owner.queue_free()
