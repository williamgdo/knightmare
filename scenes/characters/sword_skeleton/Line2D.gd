extends Line2D

var queue: Array
var max_length: int

func _process(_delta):
	var pos = Global.player.global_position
	
	queue.push_front(pos)
	
	if queue.size() > max_length:
		queue.pop_back()
		
	clear_points()
	
	for point in queue:
		add_point(point)
