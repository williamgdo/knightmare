extends ProgressBar


func _process(_delta):
	if is_equal_approx(value, 100.0) || is_zero_approx(value):
		visible = false
	else:
		visible = true


func _on_health_component_health_changed(update: HealthUpdate):
	value = update.health_percent
