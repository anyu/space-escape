extends Area2D

#onready var camera = get_node("../Camera2D")
func _on_SpaceBase_body_entered(body):
	if body.name == "Player":
		get_parent().win_game()

