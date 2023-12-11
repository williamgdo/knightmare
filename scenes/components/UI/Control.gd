extends Control

@onready var score_counter: Label = $container/score/score_counter
@onready var wave_counter: Label = $container/wave/wave_counter

# Called when the node enters the scene tree for the first time.
func _ready():
	score_counter.text = str("%05d" % Global.score)
	wave_counter.text = str("%02d" % Global.wave)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	score_counter.text = str("%05d" % Global.score)
	wave_counter.text = str("%02d" % Global.wave)
