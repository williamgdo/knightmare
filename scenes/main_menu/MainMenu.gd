extends Control

@onready var start_btn = $MarginContainer/Container/VBoxContainer/StartBtn
@export var mainGameScene: PackedScene


func _ready():
	start_btn.grab_focus()


func _on_quit_btn_pressed():
	get_tree().quit()


func _on_start_btn_pressed():
	get_tree().change_scene_to_packed(mainGameScene)
