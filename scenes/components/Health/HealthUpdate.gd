class_name HealthUpdate

var previous_health: float
var current_health: float
var max_health: float
var health_percent: float
var is_heal: bool

func _init(
	_previous_health: float,
	_current_health: float,
	_max_health: float,
	_health_percent: float,
	_is_heal: bool
):
	self.previous_health = _previous_health
	self.current_health = _current_health
	self.max_health = _max_health
	self.health_percent = _health_percent
	self.is_heal = _is_heal
