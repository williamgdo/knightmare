extends Node


var root_node: Node = null
var player: Player = null 


func instantiate_node(node: Node, position: Vector2, parent: Node):
	if root_node != null:
		var node_instance = node.instance()
		parent.add_child(node_instance)
		node_instance.global_position = position
		return node_instance

