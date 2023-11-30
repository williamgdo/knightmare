extends CharacterBody2D

@export var SPEED: float = 30.0
@export var ACCEL: float = 3
@export var points_reward: int = 100

@onready var marker: Marker2D = $Marker2D


var direction: Vector2


func _process(_delta):
	if(direction.x > 0):
		marker.scale.x = -1
	elif(direction.x < 0):
		marker.scale.x = 1
