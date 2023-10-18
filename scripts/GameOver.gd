extends CanvasLayer

func _ready():
	transition()
	$Theme.play()
	
func transition():
	$AnimationPlayer.play("fade")

func _on_RestartButton_pressed():
	var result = get_tree().change_scene("res://scenes/World.tscn")
	if result != OK:
		print("Scene change failed with error code: ", result)

func _on_QuitButton_pressed():
	get_tree().quit()
