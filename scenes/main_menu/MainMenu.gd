extends Control

@onready var start_btn = $MarginContainer/Container/VBoxContainer/StartBtn
@export var mainGameScene: PackedScene
@export var instructionsScene: PackedScene


func _ready():
	start_btn.grab_focus()


func _on_quit_btn_pressed():
	get_tree().quit()


func _on_start_btn_pressed():
	get_tree().change_scene_to_packed(mainGameScene)


func _on_controls_btn_pressed():
	get_tree().change_scene_to_packed(instructionsScene)
