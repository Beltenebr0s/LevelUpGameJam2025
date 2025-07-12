class_name Obstaculo
extends Area2D

@export var obstacleResource : ObstacleResource
signal collided_with_player

func _ready():
	$AnimatedSprite.sprite_frames = obstacleResource.animacion
	$AnimatedSprite.set_instance_shader_parameter("hue_shift", randf_range(0.0, 0.25))
	scale.x = [1, -1].pick_random()
	#position += Vector2.RIGHT * obstacleResource.variacionHorizontal * randfn(0, 0.3)
	
func _process(delta):
	move(delta)
	
func move(delta):
	$MovementHandler.move(self, obstacleResource, delta)

func collision_with_player():
	print(		"Colisión con el jugador!")
	collided_with_player.emit()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	if body is Player:
		collision_with_player()
		
func desbloquear():
	obstacleResource.desbloqueado = true
	GlobalVars.desbloquear_vecino(obstacleResource)

func _on_visible_on_screen_notifier_2d_screen_entered():
	desbloquear()
