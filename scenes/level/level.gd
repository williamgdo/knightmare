extends Node2D

var sword_skeleton = preload("res://scenes/characters/sword_skeleton/sword_skeleton.tscn")
var slime = preload("res://scenes/characters/slime/slime.tscn")
var spear_skeleton = preload("res://scenes/characters/spear_skeleton/spear_skeleton.tscn")
var shield_skeleton = preload("res://scenes/characters/shield_skeleton/shield_skeleton.tscn")

var enemy_array = [sword_skeleton, slime, spear_skeleton, shield_skeleton]


var enemy_count: int = 0
@onready var enemy_spawn_location = $World/EnemySpawnPath/EnemySpawnLocation
@onready var timer = $NewWaveTimer

func _ready():
	Global.root_node = self
	_spawn_enemies()


func _exit_tree():
	Global.root_node = null


func _spawn_enemies():
	enemy_count = 3 + Global.wave * 2
	
	for n in enemy_count:
		enemy_spawn_location.progress_ratio = randf()
		var enemy_type = randi_range(0, 2)
		var node: Node = Global.instantiate_node(enemy_array[enemy_type], enemy_spawn_location.position, self)
		
		var health_component_ref = node.get_node("HealthComponent")
		if health_component_ref != null:
			health_component_ref.died.connect(_on_enemy_died)
		else:
			push_error("health_component_ref is not defined.")
			get_tree().quit()


func _on_enemy_died(_health_update: HealthUpdate):
	enemy_count -= 1
	
	if enemy_count == 0:
		timer.start()


func _on_new_wave_timer_timeout():
	Global.wave += 1
	_spawn_enemies()
