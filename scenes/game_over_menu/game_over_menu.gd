extends CanvasLayer

@export var player: CharacterBody2D
@onready var restart_btn = $MarginContainer/VBoxContainer2/VBoxContainer/RestartBtn


func _ready():
	visible = false
	
	if player == null:
		push_error("Player not defined in GameOverMenu")
		get_tree().quit()
	
	var health_component_ref = player.get_node("HealthComponent")
	if health_component_ref != null:
		health_component_ref.died.connect(_on_health_component_died)
	else:
		push_error("health_component_ref is not defined in GameOverMenu.")
		get_tree().quit()


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		restart_btn.grab_focus()


func _on_quit_btn_pressed():
	get_tree().quit()


func _on_restart_btn_pressed():
	get_tree().reload_current_scene()


func _on_health_component_died(update):
	visible = true
	restart_btn.grab_focus()
