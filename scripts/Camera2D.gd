extends Camera2D


var MOVE_SPEED = 200

func _process(delta):
	position.y -= MOVE_SPEED * delta
