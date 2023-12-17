extends Sprite2D

const original_value = Vector2(0.315,0.27)

func _ready():
	var tween = create_tween().set_loops()
	
	tween.tween_property(self, 'scale', original_value * 1.2, 0.7)
	tween.tween_property(self, 'scale', original_value * 1, 0.7)
