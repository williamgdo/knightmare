class_name Hitbox extends Area2D


@export var damage: float = 30


func _ready():
	monitoring = false
	area_entered.connect(_on_area_entered)


func _set_monitoring(value: bool):
	if monitoring != value:
		monitoring = value


func _on_area_entered(area):
	if !(area is Hurtbox):
		return
		
	var self_bottom_pos = owner.get_node("./FeetPosition").global_position
	var area_bottom_pos = area.owner.get_node("./FeetPosition").global_position
	
#	print("self ", self_bottom_pos)
#	print("area ", area_bottom_pos)
	
	if absi(self_bottom_pos.y - area_bottom_pos.y) <= Global.Z_INDEX_RANGE:
#		print("same plane")
		var direction_to_hurtbox = (area.global_position - get_parent().global_position)
		area.hit(damage, direction_to_hurtbox)



#func _on_attack_set_hitbox_monitoring(value: bool):
#	_set_monitoring(value)
#
#func _on_attack_1_set_hitbox_monitoring(value):
##	print("changed monitoring to " + str(value))'
#	_set_monitoring(value)
#
#func _on_attack_2_set_hitbox_monitoring(value):
##	print("changed monitoring to " + str(value))'
#	_set_monitoring(value)
