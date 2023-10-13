extends Camera2D


var MOVE_SPEED = 100

func _process(delta):
	position.y -= MOVE_SPEED * delta
