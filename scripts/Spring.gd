extends Area2D

var reset_duration = 2 # time to wait before reset
var timer_elapsed = 0.0

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	var playerCollided = false

	for body in bodies:
		if body.name == "Player":
			playerCollided = true
			break

	if playerCollided:
		$AnimationPlayer.play("active")
		timer_elapsed = 0.0 
	else:
		timer_elapsed += delta  # Increment timer when the player is not overlapping
		if timer_elapsed >= reset_duration:
			$AnimationPlayer.play("idle")
