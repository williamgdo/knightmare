extends CanvasLayer

@onready var resume_btn = $VBoxContainer/ResumeBtn

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") && !Global.player.isDead():
		visible = true
		get_tree().paused = true
		resume_btn.grab_focus()


func _on_resume_btn_pressed():
	get_tree().paused = false
	visible = false


func _on_quit_btn_pressed():
	get_tree().quit()
