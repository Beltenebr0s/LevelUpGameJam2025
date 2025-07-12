class_name MovimientoDescendente
extends BaseObstacleMovement

func move(cuerpo_obstaculo : Area2D, obstaculo : ObstacleResource, delta : float) -> void:
	cuerpo_obstaculo.position += calcular_movV_desc(obstaculo) * delta
	cuerpo_obstaculo.position -= 0.5 * calcular_mov_escalera() * delta
