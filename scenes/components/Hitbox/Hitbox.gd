class_name Hitbox extends Area2D


@export var damage: float = 30


func _ready():
	monitoring = false


func _set_monitoring(value: bool):
	if monitoring != value:
		monitoring = value


#func _on_body_entered(body):
#	print(body.name + " entrou")
#	for child in body.get_children():
#		if child is Hurtbox:
#			child.hit(damage)
#			print(body.name + " took " + str(damage))


func _on_area_entered(area):
	if area is Hurtbox:
		var direction_to_hurtbox = (area.global_position - get_parent().global_position)
		area.hit(damage, direction_to_hurtbox)


func _on_attack_set_hitbox_monitoring(value: bool):
	_set_monitoring(value)

func _on_attack_1_set_hitbox_monitoring(value):
#	print("changed monitoring to " + str(value))'
	_set_monitoring(value)

func _on_attack_2_set_hitbox_monitoring(value):
#	print("changed monitoring to " + str(value))'
	_set_monitoring(value)
