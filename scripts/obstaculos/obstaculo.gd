class_name Obstaculo
extends Area2D

@export var obstacleResource : ObstacleResource
@export var variacionHorizontal : int = 50
signal collided_with_player

func _ready():
	$Sprite.texture = obstacleResource.textura
	position += Vector2.RIGHT * obstacleResource.variacionHorizontal * randfn(0, 0.3)
	
func _process(delta):
	move(delta)
	
func move(delta):
	$MovementHandler.move(self, obstacleResource.velocidad, delta)

func collision_with_player():
	print(		"Colisión con el jugador!")
	collided_with_player.emit()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_body_entered(body):
	print(		"Colisión!")
	if body is Player:
		collision_with_player()
		
func desbloquear():
	obstacleResource.desbloqueado = true
	GlobalVars.desbloquear_vecino(obstacleResource)

func _on_visible_on_screen_notifier_2d_screen_entered():
	desbloquear()
