extends Camera2D


var MOVE_SPEED = 150
var STARTING_POSITION = 400

func _ready():
	position.y = STARTING_POSITION

func _process(delta):
	position.y -= MOVE_SPEED * delta
