extends Camera2D


var speed = 200

func _process(delta):
	position.y -= speed * delta
