extends State

@export var knockback_multiplier: float = 10
@export var hurtbox: Hurtbox
@export var hitstun_time: float = 0.25

@onready var timer: Timer = $Hitstun
@export var hurt_sfx: AudioStream
@onready var sound = $HurtSound

var knockback_speed: float 
var knockback_direction: Vector2


func _ready():
	can_move = false
	
	if hurtbox == null:
		push_error("Hurtbox from %s@%s is not defined." % [self.name, owner.name])
	else:
		hurtbox.on_hit.connect(_on_hurtbox_on_hit)
	
	assert(hurt_sfx != null, "hurt_sfx from %s@%s is not defined." % [self.name, owner.name])
	sound.stream = hurt_sfx
	
	if hitstun_time != null:
		timer.wait_time = hitstun_time

func on_enter_state():
	character.velocity = Vector2.ZERO
	timer.start()
	animator.play("hit")
	sound.play()


func on_exit_state():
	character.velocity = Vector2.ZERO
	#sound.stop()


func on_physics_update(delta):
	#var sword_range = Vector2(65, 0)
	#
	#var angle = sword_range.angle_to(knockback_direction)
	#var sword_range_rotated = sword_range.rotated(angle)
	#var fixed_vector = sword_range_rotated - knockback_direction
	#fixed_vector.x = min(fixed_vector.x, 30)
	
	#character.direction = fixed_vector.normalized() * -1
	#character.velocity = fixed_vector * knockback_speed * delta
	
	character.direction = knockback_direction.normalized()
	character.velocity = knockback_direction.normalized() * knockback_speed * delta * 50
	character.move_and_slide()


func _on_animated_sprite_2d_animation_finished():
	if animator.animation == "hit":
#		animator.stop()
#		state_finished.emit(self, "idle")
		pass


func _on_hurtbox_on_hit(damage: float, _knockback_direction: Vector2):
	interrupt_state.emit("hit")
	self.knockback_direction = _knockback_direction
	self.knockback_speed = damage * knockback_multiplier


func _on_hitstun_timeout():
	state_finished.emit(self, "idle")
