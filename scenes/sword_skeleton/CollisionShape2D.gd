extends CollisionShape2D

func _on_health_component_died(update):
	set_deferred("monitorable", false) 
	set_deferred("disabled", true) 
