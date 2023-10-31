class_name Skeleton
extends CharacterBody2D


@export var SPEED: float = 30.0
@export var ACCEL: float = 3

#@onready var state_machine: SkeletonStateMachine = $SkeletonStateMachine
#@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var marker: Marker2D = $Marker2D


var direction: Vector2


func _process(_delta):
	if(direction.x > 0):
		marker.scale.x = 1
	elif(direction.x < 0):
		marker.scale.x = -1
