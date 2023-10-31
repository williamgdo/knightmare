extends Control


@export var label: PackedScene
@export var damage_color: Color = Color.DARK_RED
@export var heal_color: Color = Color.DARK_GREEN
@export var default_color: Color = Color.WHITE

#func on_signal_health_changed(node: Node, value_changed: float):


#func _on_hurtbox_on_hit(damage):
#	var label_instance: Label = label.instantiate()
#	self.get_parent().add_child(label_instance)
#	label_instance.text = str(damage)
#	label_instance.queue_free()


func _on_health_component_health_changed(update: HealthUpdate):
	var health_diff = update.current_health - update.previous_health 
	
	var label_instance: Label = label.instantiate()
	label_instance.text = str(health_diff)
#	self.get_parent().add_child(label_instance)
	self.add_child(label_instance)
	
	if health_diff > 0:
		label_instance.modulate = heal_color
	elif health_diff < 0:
		label_instance.modulate = damage_color
	else:
		label_instance.modulate = default_color

#	await get_tree().create_timer(1).timeout
#	label_instance.queue_free()
