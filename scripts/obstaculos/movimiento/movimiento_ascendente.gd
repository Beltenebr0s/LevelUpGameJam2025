class_name MovimientoAscendente
extends BaseObstacleMovement

func move(obstaculo : Area2D, velocidad : int, delta : float) -> void:
	var dir = Vector2.UP
	obstaculo.position += dir * velocidad * GlobalVars.mult_global * delta
