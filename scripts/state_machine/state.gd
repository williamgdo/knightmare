class_name State extends Node

signal state_finished
signal interrupt_state(new_state_name: String)

@export var can_move: bool = true

var character: CharacterBody2D
var animator: AnimatedSprite2D
var label: Label


func on_enter_state() -> void:
	pass


func on_exit_state() -> void:
	pass


func on_process_update(_delta: float):
	pass


func on_physics_update(_delta: float):
	pass
