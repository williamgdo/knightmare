class_name State extends Node

signal state_finished

@export var can_move: bool = true


func on_enter_state() -> void:
	pass


func on_exit_state() -> void:
	pass


func on_process_update(_delta: float):
	pass


func on_physics_update(_delta: float):
	pass
