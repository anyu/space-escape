extends Node2D

export(PackedScene) var ufo_scene
export(PackedScene) var laser_scene

const MIN_UFO_WAIT_SECS = 1.0
const MAX_UFO_WAIT_SECS = 8.0

onready var camera = $Camera2D
onready var space_base = $SpaceBase

func _ready():
	new_game()

func new_game():
	$StartTimer.start()
	$Theme.play()

func _on_StartTimer_timeout():
	$UFOTimer.start()

func _on_UFOTimer_timeout():
	var ufo = ufo_scene.instance()
	ufo.position.x = 0
	ufo.position.y = camera.global_position.y
	add_child(ufo)

	var random_secs = randf() * (MAX_UFO_WAIT_SECS - MIN_UFO_WAIT_SECS) + MIN_UFO_WAIT_SECS
	$UFOTimer.wait_time = random_secs
	$UFOTimer.start()

func win_game():
	$Theme.stop()
	$Win.play()
	$Player.game_won = true
	$WinMenu.show_popup_menu()
	cleanup()
	switch_to_menu(5)

func end_game():
	cleanup()
	switch_to_menu(3)

func cleanup():
	$UFOTimer.stop()
	$StartTimer.stop()
	
func switch_to_menu(delay):
	yield(get_tree().create_timer(delay), "timeout")
	get_tree().change_scene("res://scenes/GameOver.tscn")
