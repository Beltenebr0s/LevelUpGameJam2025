class_name MovimientoEstatico
extends BaseObstacleMovement

func move(cuerpo_obstaculo : Area2D, obstaculo : ObstacleResource, delta : float) -> void:
	var dir = Vector2.UP
	var movEscalera = dir * GlobalVars.scroll_speed * delta
	cuerpo_obstaculo.position += movEscalera
