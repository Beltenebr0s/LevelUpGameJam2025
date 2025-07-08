class_name MovimientoAscendente
extends BaseObstacleMovement

func move(cuerpo_obstaculo : Area2D, obstaculo : ObstacleResource, delta : float) -> void:
	cuerpo_obstaculo.position += calcular_movV_asc(obstaculo) * delta
	cuerpo_obstaculo.position += calcular_mov_escalera() * delta
