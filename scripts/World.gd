extends Node2D

#export(PackedScene) var meteoroid_scene

#func game_over():
#	$MeteoroidTimer.stop()
#
#func new_game():
#	$StartTimer.start()
	
#func _ready():
#	randomize()	
#	new_game()

#
#func _on_StartTimer_timeout():
#	$MeteoroidTimer.start()

#func _on_MeteoroidTimer_timeout():
#	var meteoroid = meteoroid_scene.instance()
#	var meteoroid_spawn_location = get_node("MeteoroidPath/MeteoroidSpawnLocation")
#	meteoroid_spawn_location.offset = randi()
#
#	var direction = meteoroid_spawn_location.rotation + PI / 2
#	meteoroid.position = meteoroid_spawn_location.position
#	meteoroid.rotation = direction
#
#	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
#	meteoroid.linear_velocity = velocity.rotated(direction)
##
#	var gravity_acceleration = 9.8
#	meteoroid.linear_velocity.y -= gravity_acceleration
#
#	add_child(meteoroid)
