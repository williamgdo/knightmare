extends Node2D


func _ready():
	Global.root_node = self


func _exit_tree():
	Global.root_node = null
