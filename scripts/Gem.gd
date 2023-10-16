extends Area2D

signal gem_collected

func _on_Gem_body_entered(body):
	if body.name == "Player":
		$CollectGem.play()
		emit_signal("gem_collected")
		queue_free()
