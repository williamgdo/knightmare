extends Control

@onready var start_btn = $MarginContainer/Container/VBoxContainer/StartBtn
@export var mainGameScene: PackedScene
@export var instructionsScene: PackedScene
@onready var options = $Options
@onready var credits = $Credits


#func _process(_delta):
	#if Input.is_action_pressed("up") or Input.is_action_pressed("down"):
		#var focused_node = get_viewport().gui_get_focus_owner()
		#if focused_node == null:
			#start_btn.grab_focus()

func _ready():
	start_btn.grab_focus()


func _on_quit_btn_pressed():
	get_tree().quit()


func _on_start_btn_pressed():
	get_tree().change_scene_to_packed(mainGameScene)


func _on_controls_btn_pressed():
	get_tree().change_scene_to_packed(instructionsScene)
	

func _on_options_btn_pressed():
	options.visible = true
	


func _on_credits_btn_pressed():
	credits.visible = true


func _on_credits_visibility_changed():
	if credits.visible:
		var initial_focus = credits.get_node("BackBtn")
		initial_focus.grab_focus()
	else:
		start_btn.grab_focus()


func _on_options_visibility_changed():
	if options.visible:
		var initial_focus = options.get_node("Control/BackBtn")
		initial_focus.grab_focus()
	else:
		start_btn.grab_focus()
