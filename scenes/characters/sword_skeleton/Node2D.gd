extends Node2D

func _draw() -> void:
	draw_line(Vector2.ZERO, Vector2.RIGHT * 300, Color.DARK_RED, 8.0)
