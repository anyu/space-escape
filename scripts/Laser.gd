extends Area2D

export var MOVE_SPEED = 500

func _ready():
	$LaserBullet.play()
	
func _physics_process(delta):
	global_position.y += MOVE_SPEED * delta
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Laser_body_entered(body):
	if body.name == "player":
		print("hit player")
