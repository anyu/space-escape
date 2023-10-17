extends Path2D

onready var follow = $UFOPathFollow
var cameraOffset = Vector2(0, 700)

func _ready():
	set_process(true)

func _process(delta):
	var world = get_parent()
	var camera = world.get_node("Camera2D")
	var cameraGlobalPosition = camera.global_position
	
	# Set the Path2D's global position to the camera's position plus the offset
	follow.global_position = cameraGlobalPosition 
	follow.set_offset(follow.get_offset() + 350 * delta)
