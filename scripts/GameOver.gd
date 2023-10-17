extends CanvasLayer

func _ready():
	transition()
	get_node("Theme").play()
	
func transition():
	$AnimationPlayer.play("fade")

func _on_RestartButton_pressed():
	get_tree().change_scene("res://scenes/World.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
