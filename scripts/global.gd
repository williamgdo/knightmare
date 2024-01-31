extends Node


var root_node: Node = null
var player: Player = null 
var wave = 1
var score = 0

const Z_INDEX_RANGE = 8

#func _ready():
#	Engine.max_fps = 15

func reset():
	wave = 1
	score = 0


func instantiate_node(node, position: Vector2, parent):
	if root_node != null:
		var node_instance = node.instantiate()
		parent.add_child(node_instance)
		node_instance.global_position = position
		return node_instance


func check_default_nodes(node: Node):
	assert(node.get_node("FeetPosition") != null, "FeetPosition not defined in %s." % node.name)
	assert(node.get_node("Marker2D") != null, "Marker2D not defined in %s." % node.name)
