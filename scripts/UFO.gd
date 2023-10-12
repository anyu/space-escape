extends Area2D

func start_movement(initial_pos, final_pos):
	$Tween.interpolate_property(self, "position", initial_pos, final_pos, 1.0, Tween.TRANS_CUBIC)
	$Tween.start()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

