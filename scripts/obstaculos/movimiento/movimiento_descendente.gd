class_name MovimientoDescendente
extends BaseObstacleMovement

func move(cuerpo_obstaculo : Area2D, obstaculo : ObstacleResource, delta : float) -> void:
	var dir = Vector2.DOWN
	var movV = dir * obstaculo.velocidad * GlobalVars.mult * delta
	# var movEscalera = dir * GlobalVars.scroll_speed * delta
	cuerpo_obstaculo.position += movV
