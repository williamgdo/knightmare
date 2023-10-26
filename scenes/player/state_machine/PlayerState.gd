class_name PlayerState extends State

#@export var player: CharacterBody2D
#@export var animator: AnimatedSprite2D

var player: CharacterBody2D
var animator: AnimatedSprite2D

func _ready():
	player = get_node("/root/player")
	animator = get_node("/root/player/AnimatedSprite2D")
