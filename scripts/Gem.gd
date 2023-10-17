extends Area2D

signal gem_collected

func _on_Gem_body_entered(body):
	if body.name == "Player":
		emit_signal("gem_collected")
		body.collect_gem()
		queue_free()
