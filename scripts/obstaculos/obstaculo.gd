extends Sprite2D
class_name Obstaculo

@export var obstacleResource : ObstacleResource
signal collided_with_player

func _ready():
	texture = obstacleResource.textura
	
func _process(delta):
	move(delta)
	
func move(delta):
	var dir_vector
	if (obstacleResource.direccion == Enums.DireccionObstaculo.DIRECCION_ASCENDENTE):
		dir_vector = Vector2.UP
	elif (obstacleResource.direccion == Enums.DireccionObstaculo.DIRECCION_DESCENDENTE):
		dir_vector = Vector2.DOWN
	else:
		dir_vector = Vector2.UP 
	position += dir_vector.normalized() * obstacleResource.velocidad * delta

func collision_with_player():
	print("TODO: pues ver qué hacemos al chocar con el jugador")

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
