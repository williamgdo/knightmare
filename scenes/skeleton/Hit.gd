extends PlayerState


@export var knockback_multiplier: float = 5


@onready var timer: Timer = $Timer


var knockback_speed: float 
var knockback_direction: Vector2


func on_enter_state():
	timer.start()
	animator.play("hit")


func on_exit_state():
	character.velocity = Vector2.ZERO


func on_physics_update(delta):
	var sword_range = Vector2(65, 0)
	
	var angle = sword_range.angle_to(knockback_direction)
	var sword_range_rotated = sword_range.rotated(angle)
	var fixed_vector = sword_range_rotated - knockback_direction
	fixed_vector.x = min(fixed_vector.x, 30)
	
	character.direction = fixed_vector.normalized() * -1
	character.velocity = fixed_vector * knockback_speed * delta
	character.move_and_slide()


func _on_animated_sprite_2d_animation_finished():
	if animator.animation == "hit":
#		animator.stop()
#		state_finished.emit(self, "idle")
		pass


func _on_hurtbox_on_hit(damage: float, knockback_direction: Vector2):
	interrupt_state.emit("hit")
	self.knockback_direction = knockback_direction
	self.knockback_speed = damage * knockback_multiplier


func _on_timer_timeout():
	state_finished.emit(self, "idle")
#	pass
