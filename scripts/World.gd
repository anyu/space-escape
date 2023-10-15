extends Node2D

export(PackedScene) var ufo_scene
export(PackedScene) var laser_scene

onready var camera = get_node("Camera2D")

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
	ufo.position.x = 0
	ufo.position.y = camera.global_position.y
	add_child(ufo)

