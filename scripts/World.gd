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
#	ufo.position = Vector2(320, 320)
#	var ufo_spawn_location = get_node("UFOPath/UFOSpawnLocation")
#	ufo_spawn_location.offset = randi()
	add_child(ufo)
#	ufo.global_position = Vector2(0,200)
	ufo.start_movement(Vector2(0, 50), Vector2(700,50))

#	var velocity = Vector2(rand_range(200,400), 0.0)
#	ufo.velocity = 
	



