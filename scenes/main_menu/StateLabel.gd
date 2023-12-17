extends Label

func _ready():
	var tween = create_tween().set_loops()
	
	tween.tween_property(self, 'theme_override_font_sizes/font_size', 33, 0.7).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, 'theme_override_font_sizes/font_size', 28, 0.7).set_trans(Tween.TRANS_EXPO)
