extends Camera2D


var MOVE_SPEED = 50

func _process(delta):
	position.y -= MOVE_SPEED * delta
