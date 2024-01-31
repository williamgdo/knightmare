extends Control

@onready var back_btn = $BackBtn
var mainMenuScene = load("res://scenes/main_menu/MainMenu.tscn")


func _ready():
	back_btn.grab_focus()


func _on_back_btn_pressed():
	get_tree().change_scene_to_packed(mainMenuScene)
#	get_tree().unload_current_scene()
