extends Control

@onready var score_counter: Label = $container/score/score_counter
@onready var wave_counter: Label = $container/wave/wave_counter
@onready var progress_bar = $HP/ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	score_counter.text = str("%05d" % Global.score)
	wave_counter.text = str("%02d" % Global.wave)
	
	if Global.player:
		Global.player.get_node("HealthComponent").health_changed.connect(_on_player_health_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	score_counter.text = str("%05d" % Global.score)
	wave_counter.text = str("%02d" % Global.wave)


func _on_player_health_changed(health_update: HealthUpdate):
	#progress_bar.value = health_update.current_health
	var tween = get_tree().create_tween()
	tween.tween_property(progress_bar, "value", health_update.current_health, 0.5).set_trans(Tween.TRANS_QUAD)
