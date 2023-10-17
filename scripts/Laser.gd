extends Area2D

export var MOVE_SPEED = 500

#onready var ufo = get_parent()
#onready var world = ufo.get_parent()

func _ready():
	$LaserBullet.play()
	
func _physics_process(delta):
	global_position.y += MOVE_SPEED * delta
	
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Laser_body_entered(body):
	if body.name == "Player":
		$Ouch.play()
		body.lose_health()

