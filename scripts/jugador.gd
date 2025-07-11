extends CharacterBody2D
class_name Player
@export var running_speed: float = 200.0
var dash_speed : float = 300.0
@onready var dash_enabled : bool = true
var dash_direction : Vector2

func game_over():
	$AnimationPlayer.play("fall")
	await $AnimationPlayer.animation_finished

func _ready():
	dash_enabled = true

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	var speed = running_speed

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_just_pressed("dash") and dash_enabled:
		dash_enabled = false
		#$CollisionShape2D.disabled = true
		$AnimationPlayer.play("Dash")
		$DashCooldownTimer.start()
		dash_direction = direction
		set_collision_layer_value(1, false)
		set_collision_layer_value(4, true)
	
	if $AnimationPlayer.current_animation == "Dash":
		speed += dash_speed
		direction = dash_direction
		
	if Input.is_action_just_pressed("invincible"):
		print("invencible")
		$CollisionShape2D.disabled = true

	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	
func restore_collider():
	set_collision_layer_value(4, false)
	set_collision_layer_value(1, true)


func _on_dash_cooldown_timer_timeout():
	print("Dash enabled")
	dash_enabled = true
