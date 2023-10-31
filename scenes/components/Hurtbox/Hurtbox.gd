class_name Hurtbox extends Area2D


@export var health_component: health_component


signal on_hit(damage: float)


func _ready():
	if health_component != null:
		health_component.died.connect(_on_health_component_died)


func hit(value: float, knockback_direction: Vector2):
#	print(owner.name + " took " + str(value) + " damage")
	on_hit.emit(value, knockback_direction)
	
	if health_component != null: 
		health_component.damage(value)


func _on_health_component_died(_health_update):
	set_deferred("monitorable", false) 
#	set_deferred("monitoring", false) 
#	$CollisionShape2D.set_deferred("disabled", true)
