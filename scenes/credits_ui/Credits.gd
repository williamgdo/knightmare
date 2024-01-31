extends Control

@onready var back_btn = $BackBtn
var mainMenuScene = load("res://scenes/main_menu/MainMenu.tscn")

func _ready():
	visible = false


func _unhandled_input(event):
	if visible == false:
		pass
	else:
		var focused_node = get_viewport().gui_get_focus_owner()
		if focused_node == null:
			back_btn.grab_focus()


func _on_back_btn_pressed():
	visible = false


func _on_szadi_art_pressed():
	OS.shell_open("https://szadiart.itch.io/")


func _on_personagens_pressed():
	OS.shell_open("https://szadiart.itch.io/hero-and-opponents-animation")


func _on_mapa_pressed():
	OS.shell_open("https://szadiart.itch.io/rogue-fantasy-catacombs")


func _on_incompetech_pressed():
	OS.shell_open("https://incompetech.com/wordpress/")
	

func _on_sfx_pressed():
	OS.shell_open("https://pixabay.com")


func _on_william_pressed():
	OS.shell_open("https://github.com/williamgdo")
