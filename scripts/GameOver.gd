extends CanvasLayer

func _ready():
#	var t=Texture.new()
#	t=load("res://image/game_over_menu.png")
#	t.add_image(t,10,10)
	transition()
	
func transition():
	$AnimationPlayer.play("fade")

func _on_RestartButton_pressed():
	get_tree().change_scene("res://scenes/World.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
