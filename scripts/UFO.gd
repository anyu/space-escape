extends Area2D
var speed = 250

var laser_scene = preload("res://scenes/Laser.tscn")
onready var sprite = $Sprite
#
func _ready():
#	shoot()
	$LaserTimer.start()
	
func _process(delta):
	global_position.x += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
#func shoot():
#	var laser = laser_scene.instance()
#	laser.global_position = global_position
#	add_child(laser)

func _on_LaserTimer_timeout():
	var laser = laser_scene.instance()
	laser.global_position = global_position
	add_child(laser)
