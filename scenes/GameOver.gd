extends Popup


var gameOverLabel


func _ready():
	gameOverLabel = $GameOver

func show_game_over():
	gameOverLabel.text = "Game Over"
