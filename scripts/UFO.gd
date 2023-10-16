extends Area2D
var MOVE_SPEED = 250

var laser_scene = preload("res://scenes/Laser.tscn")
onready var sprite = $Sprite

func _ready():
	$LaserTimer.start()
	$UFOArrival.play()
	
func _process(delta):
	global_position.x += MOVE_SPEED * delta
	
func _on_LaserTimer_timeout():
	var laser = laser_scene.instance()
	add_child(laser)
	var ufo_height = sprite.texture.get_height()
	laser.global_position = global_position + Vector2(0, ufo_height + 10)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
