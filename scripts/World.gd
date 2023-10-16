extends Node2D

export(PackedScene) var ufo_scene
export(PackedScene) var laser_scene
#export(PackedScene) var gem_counter_scene

onready var camera = get_node("Camera2D")


func _ready():
	randomize()
	new_game()

func new_game():
	$StartTimer.start()

func _on_StartTimer_timeout():
	$UFOTimer.start()
#	var gem_counter = gem_counter_scene.instance()
#	gem_counter.position = camera.position

func _on_UFOTimer_timeout():
	var ufo = ufo_scene.instance()
	ufo.position.x = 0
	ufo.position.y = camera.global_position.y
	add_child(ufo)
	
func end_game():
	$UFOTimer.stop()
	yield(get_tree().create_timer(2.5), "timeout")	
	get_tree().change_scene("res://scenes/GameOver.tscn")
