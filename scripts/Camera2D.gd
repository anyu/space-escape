extends Camera2D


var MOVE_SPEED = 150

func _process(delta):
	position.y -= MOVE_SPEED * delta
