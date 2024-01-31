extends State

@export var knockback_multiplier: float = 5
@export var hurtbox: Hurtbox

@onready var timer: Timer = $Hitstun
@onready var hit_sound = $HitSound


var knockback_speed: float 
var knockback_direction: Vector2

var animation_array = ["hit-1", "hit-2"]

func _ready():
	can_move = false
	
	if hurtbox == null:
		push_error("Hurtbox from %s@%s is not defined." % [self.name, owner.name])
	else:
		hurtbox.on_hit.connect(_on_hurtbox_on_hit)


func on_enter_state():
	character.velocity = Vector2.ZERO
	timer.start()
	var rand_anim = animation_array[randi() % 2]
	animator.play(rand_anim)
	hit_sound.play()


func on_exit_state():
	character.velocity = Vector2.ZERO
	if Global.player.isDead():
		hit_sound.stop()
		

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
	if animator.animation == "hit-1" || animator.animation == "hit-2":
#		animator.stop()
#		state_finished.emit(self, "idle")
		pass


func _on_hurtbox_on_hit(damage: float, _knockback_direction: Vector2):
	interrupt_state.emit("hit")
	self.knockback_direction = _knockback_direction
	self.knockback_speed = damage * knockback_multiplier


func _on_hitstun_timeout():
	state_finished.emit(self, "idle")
