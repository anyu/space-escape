extends Area2D

export var speed = 300 

func _physics_process(delta):
	position.y += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Laser_body_entered(body):
	if body.name == "player":
		print("hit player")
