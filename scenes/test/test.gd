extends Node2D


func _ready():
	Global.root_node = self
	Global.wave = 99
	Global.score = 42069


func _exit_tree():
	Global.root_node = null		
