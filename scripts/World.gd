extends Node2D

export(PackedScene) var meteoroid_scene

func game_over():
	$MeteoroidTimer.stop()

func new_game():
	$StartTimer.start()
	
func _ready():
	randomize()	
	new_game()


func _on_StartTimer_timeout():
	$MeteoroidTimer.start()

func _on_MeteoroidTimer_timeout():
	var meteoroid = meteoroid_scene.instance()

	var random_x = int(get_viewport_rect().size.x)

	var meteoroid_spawn_location = Vector2(random_x, -700)
	meteoroid.position = meteoroid_spawn_location
	
	# Set the meteoroid's direction to move downward.
	var direction = PI / 4
	meteoroid.rotation = direction

	var velocity = Vector2(0.0, rand_range(350.0, 650.0))
	meteoroid.linear_velocity = velocity.rotated(direction)
  
	var gravity_acceleration = 9.8
	meteoroid.linear_velocity.y -= gravity_acceleration

	add_child(meteoroid)
