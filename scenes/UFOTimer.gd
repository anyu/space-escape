extends Timer



func _ready():
	wait_time = randf() * 2 + 1
	set_wait_time(wait_time)
	start()

func _on_timeout():
	var ufo = 
	# Set its position, properties, or add it to the scene
	# Example: get_tree().get_root().add_child(newNode2D)
