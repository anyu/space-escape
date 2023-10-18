extends KinematicBody2D

const MOVE_SPEED = 500
const JUMP_FORCE = 1500
const GRAVITY = 50
const MAX_FALL_SPEED = 1500
const SPRING_FORCE = 2000

const MAX_HP = 100
const DAMAGE_STEP = 25

const COLOR_PBAR_HIGH = "74ff54"
const COLOR_PBAR_LOW = "ff0049"

onready var screen_size = get_viewport_rect().size
onready var animation_player = $AnimationPlayer
onready var sprite = $Sprite
onready var camera = get_node("../Camera2D")
onready var hbar = get_node("../StatsUI/HP/HealthBar")

var y_velo = 0
var facing_right = false
var is_hit = false
var is_dead = false
var game_won = false
var gems_collected = 0
var current_hp = MAX_HP

func _physics_process(_delta):
	screen_constrain()
	if is_hit:
		play_animation("hit")
		if !is_dead:
			yield(get_tree().create_timer(0.5), "timeout")
			is_hit = false
	if !is_dead and !game_won:
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

func screen_constrain():
	if position.x > screen_size.x:
		position.x = screen_size.x
	if position.x < 0:
		position.x = 0
	
func flip():
	facing_right = !facing_right
	sprite.flip_h = !sprite.flip_h
	
func play_animation(animation_name):
	if animation_player.is_playing() and animation_player.current_animation == animation_name:
		return
	animation_player.play(animation_name)

func _on_Spring_body_entered(body):
	if body.name == "Player":
		y_velo = -SPRING_FORCE
		$Bounce.play()

func _on_Spring_body_exited(body):
	if body.name == "Player":
		yield(get_tree().create_timer(1.0), "timeout")
	$Bounce.stop()

func collect_gem():
	$CollectGem.play()

func lose_health():
	is_hit = true
	$Ouch.play()
	current_hp -= DAMAGE_STEP
	var percentage_hp = int((float(current_hp)/MAX_HP) * 100)
	hbar.value = percentage_hp
	if percentage_hp > MAX_HP/4.0:
		hbar.set_tint_progress(COLOR_PBAR_HIGH)
	else:
		hbar.set_tint_progress(COLOR_PBAR_LOW)
	if hbar.value == 0:
		die()

func die():
	is_dead = true
	if hbar.value == 0:
		slow_death()
	else:
		fall_death()
	get_parent().get_node("Theme").stop()
	get_parent().end_game()

func slow_death():
	$SlowDeath.play()

func fall_death():
	$Falling.play()

func _on_VisibilityNotifier2D_screen_exited():
#	Don't trigger end game if player exits top of screen
	var player_exits_screen_top = global_position.y - (sprite.texture.get_size().y / 2) < camera.global_position.y
	if player_exits_screen_top or game_won:
		pass
	else:
		die()
