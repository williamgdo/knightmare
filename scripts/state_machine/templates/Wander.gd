extends State

@onready var timer: Timer = $WanderTimer

var move_direction: Vector2 = Vector2.ZERO
var wander_duration: float
var is_waiting: bool


func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), randf_range(-1,1)).normalized()
	wander_duration = randf_range(1, 3)


func on_enter_state():	
	randomize_wander()


func on_process_update(_delta):
#	label.text = "%.2f %s %.2f" % [wander_duration, is_waiting, timer.get_time_left()]
#	label.text = "%.2f %.2f %.2f" % [character.velocity.length(), character.velocity.x, character.velocity.y]
	character.direction = move_direction.normalized()


func on_physics_update(delta):
	if wander_duration > 0:
		wander_duration -= delta
	else:
		if !is_waiting:
			is_waiting = true
			character.velocity = Vector2.ZERO
			timer.start()
			
	if !is_waiting:
		character.direction = move_direction.normalized()
		character.move_character(delta)


func _on_wander_timer_timeout():
	is_waiting = false
	timer.set_wait_time(randf_range(1, 3))
	randomize_wander()
