extends State

var attack_array = []
var next_attack = null

@onready var line = $"../../DrawDebug"

func _ready():
	for child in get_children():
		if child is State:
#			var attack = {
#				"name": child.name,
#				"range": child.range,
#			}
#			var attack = Attack.new(child.name, child.range)
			if child.attack_data == null :
				push_error("attack_data not defined in attack State of " + owner.name)
			else:
				attack_array.push_back(child.attack_data)
#				print(str(child.attack_data.range))


func on_physics_update(_delta):
#	Engine.time_scale = 0.5
	
	var character_position = character.get_node("FeetPosition").global_position
	var player_position = Global.player.get_node("FeetPosition").global_position
	
	if next_attack == null:
		next_attack = get_random_attack()
	
	var attack_position = get_attack_position(character_position, player_position, 50)
	
	if character_position.distance_to(attack_position) >= 100:
		state_finished.emit(self, "follow")
	
	character.direction = attack_position - character_position
	character.face = (player_position - character_position).normalized()
	
	if is_in_range(character_position, attack_position):
		state_finished.emit(self, "attack")
	else:
		character.move_character(_delta)


func is_in_range(current_position, target_position):
	var radius = Global.Z_INDEX_RANGE
	var distance = current_position.distance_to(target_position)
	return distance <= radius


func get_random_attack():
	var rand_index = randi() % attack_array.size()
	return attack_array[rand_index]


# not currently in use
# its supposed to take into account that some moves have an internal cooldown
# but moves with said cooldown are not developed yet
func get_random_available_attack():
	var tmp_attack_array = attack_array
	var attack = null
	
	while tmp_attack_array.is_empty() == false:
		var rand_index = randi() % tmp_attack_array.size()
		var rand_attack = tmp_attack_array[rand_index]
		
		if rand_attack.ready == false:
			tmp_attack_array.erase(rand_attack)
		else:
			attack = rand_attack
	
	return attack

func get_attack_position(character_position, player_position, attack_range):
	var right_point = player_position + Vector2(attack_range, 0)
	var left_point = player_position - Vector2(attack_range, 0)
	
	line.line_left.origin = character_position
	line.line_left.destination = left_point
	line.line_right.origin = character_position
	line.line_right.destination = right_point
	
	var distance_to_right = character_position.distance_to(right_point)
	var distance_to_left = character_position.distance_to(left_point)
	
	var target_position
	
	if distance_to_left < distance_to_right:
		target_position = left_point
		line.line_left.color = Color.GREEN
		line.line_right.color = Color.RED
#		print("LEFT")
	else:
		target_position = right_point
		line.line_left.color = Color.RED
		line.line_right.color = Color.GREEN
#		print("RIGHT")

	return target_position
