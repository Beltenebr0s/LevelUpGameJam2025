class_name MovimientoEstatico
extends BaseObstacleMovement

func move(cuerpo_obstaculo : Area2D, obstaculo : ObstacleResource, delta : float) -> void:
	cuerpo_obstaculo.position += calcular_mov_escalera() * delta
