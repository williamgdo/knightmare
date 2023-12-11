extends Node2D

var line_left = { "origin": Vector2.ZERO, "destination": Vector2.ZERO, "color": Color.WHITE_SMOKE}
var line_right = { "origin": Vector2.ZERO, "destination": Vector2.ZERO, "color": Color.WHITE_SMOKE}
var distance_to_player = { "origin": Vector2.ZERO, "destination": Vector2.ZERO, "color": Color.WHITE_SMOKE}



func _draw():
	draw_line(to_local(line_left.origin), to_local(line_left.destination), line_left.color, 1.0)
	draw_line(to_local(line_right.origin), to_local(line_right.destination), line_right.color, 1.0)
#	draw_line(distance_to_player.origin, distance_to_player.destination, distance_to_player.color, 1.0)
	draw_circle(Vector2.ZERO, 100, Color(1, 0.843137, 0, 0.2))

func _physics_process(_delta):
	var player_position = to_local(Global.player.get_node("FeetPosition").global_position)
	distance_to_player.destination = player_position
#	distance_to_player.origin = to_local(get_node("../FeetPosition").global_position)
	distance_to_player.origin = Vector2.ZERO
	if Vector2.ZERO.distance_to(player_position) < 100:
		distance_to_player.color = Color.GREEN
	else:
		distance_to_player.color = Color.RED	
		
	queue_redraw()
