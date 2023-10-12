extends Node2D

export(PackedScene) var ufo_scene

func game_over():
	$UFOTimer.stop()

func new_game():
	$StartTimer.start()

func _ready():
	randomize()	
	new_game()

func _on_StartTimer_timeout():
	$UFOTimer.start()

func _on_UFOTimer_timeout():
	var ufo = ufo_scene.instance()
	ufo.position = Vector2(320, 320)
	var ufo_spawn_location = get_node("UFOPath/UFOSpawnLocation")
	ufo_spawn_location.offset = randi()
	var direction = ufo_spawn_location.rotation + PI / 2
	ufo.position = ufo_spawn_location.position
	direction += rand_range(-PI / 4, PI / 4)

	ufo.rotation = direction
	print("position", ufo.position)
	print("rotation", ufo.rotation)
	
	var velocity = Vector2(rand_range(200,400), 0.0)
	ufo.linear_velocity = velocity.rotated(direction)
	
	add_child(ufo)


