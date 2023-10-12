extends RigidBody2D

var speed = 150

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

