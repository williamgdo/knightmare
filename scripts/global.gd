extends Node


var root_node: Node = null
var player: Player = null 


func instantiate_node(node, position: Vector2, parent):
	if root_node != null:
		var node_instance = node.instantiate()
		parent.add_child(node_instance)
		node_instance.global_position = position
		return node_instance

