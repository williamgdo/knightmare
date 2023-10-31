class_name health_component extends Node


@export var max_health: float = 100


signal health_changed(update: HealthUpdate)
signal died(update: HealthUpdate)


var current_health: float
#	set(value):
#		_set_health(value)
#	get:
#		return current_health

var isDead: bool


func _ready():
	current_health = max_health
	isDead = false


func _set_health(value: float):
	var previous_health = current_health

	current_health = clampf(value, 0, max_health)

	var health_update: HealthUpdate = HealthUpdate.new(
		previous_health,
		current_health,
		max_health,
		current_health_percent(),
		previous_health < current_health
	)

	health_changed.emit(health_update)
	
	if !has_health_remaining():
		isDead = true
		died.emit(health_update)


func set_max_health(value: float):
	max_health = value


func has_health_remaining() -> bool:
	return !is_zero_approx(current_health)


func is_full_health() -> bool:
	return is_equal_approx(current_health, max_health) 


func current_health_percent() -> float:
	if max_health > 0:
		return (current_health / max_health) * 100
	else:
		return 0


func damage(value: float):
	_set_health(current_health - value) 


func heal(value: float):
	_set_health(current_health + value) 
