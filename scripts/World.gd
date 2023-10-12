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
	add_child(ufo)
	ufo.start_movement(Vector2(0, 50), Vector2(700,50))
