class_name MovimientoDescendente
extends BaseObstacleMovement

func move(obstaculo : Area2D, velocidad : int, delta : float) -> void:
	var dir = Vector2.DOWN
	obstaculo.position += dir * velocidad * delta
