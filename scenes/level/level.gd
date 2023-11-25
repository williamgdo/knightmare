extends Node2D

var enemy1 = preload("res://scenes/sword_skeleton/sword_skeleton.tscn")

var sword_skeleton = preload("res://scenes/sword_skeleton/sword_skeleton.tscn")
var slime = preload("res://scenes/slime/slime.tscn")
var spear_skeleton = preload("res://scenes/spear_skeleton/spear_skeleton.tscn")

var enemy_array = [sword_skeleton, slime, spear_skeleton]


var enemy_count: int = 0
@onready var enemy_spawn_location = $World/EnemySpawnPath/EnemySpawnLocation

func _ready():
	Global.root_node = self
	_spawn_enemies()


func _exit_tree():
	Global.root_node = null


func _spawn_enemies():
#	enemy_spawn_location.progress_ratio = randf()
#	enemy_spawn_location.progress_ratio = 0.9

	for n in 8:
		enemy_spawn_location.progress_ratio = randf()
		var enemy_type = randi_range(0, 2)
		Global.instantiate_node(enemy_array[enemy_type], enemy_spawn_location.position, self)


func _on_enemy_died():
	enemy_count -= 1
