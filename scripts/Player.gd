extends KinematicBody2D

const MOVE_SPEED = 500
const JUMP_FORCE = 1200
const GRAVITY = 50
const MAX_FALL_SPEED = 1000
const SPRING_FORCE = 1500

onready var animation_player = $AnimationPlayer
onready var sprite = $Sprite

var y_velo = 0
var facing_right = false

func _physics_process(_delta):
	var move_dir = 0
	if Input.is_action_pressed("move_right"):
		move_dir += 1
	if Input.is_action_pressed("move_left"):	
		move_dir -= 1
	var _m = move_and_slide(Vector2(move_dir * MOVE_SPEED, y_velo), Vector2(0,-1))
	
		
	var grounded = is_on_floor()
	y_velo += GRAVITY
	if grounded and Input.is_action_just_pressed("jump"):
		y_velo = -JUMP_FORCE
	if grounded and y_velo >= 5:
		y_velo = 5
	if y_velo > MAX_FALL_SPEED:
		y_velo = MAX_FALL_SPEED
		
	if facing_right and move_dir < 0:
		flip()
	if !facing_right and move_dir > 0:
		flip()
	
	if grounded:
		if move_dir == 0:
			play_animation("idle")
		else:
			play_animation("walk")
	else:
		play_animation("jump")

func flip():
	facing_right = !facing_right
	sprite.flip_h = !sprite.flip_h
	
func play_animation(animation_name):
	if animation_player.is_playing() and animation_player.current_animation == animation_name:
		return
	animation_player.play(animation_name)


func _on_Spring_body_entered(body):
	y_velo = -SPRING_FORCE
