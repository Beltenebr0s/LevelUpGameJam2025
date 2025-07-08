class_name MovimientoZigzagDesc
extends BaseObstacleMovement

func move(cuerpo_obstaculo : Area2D, obstaculo : ObstacleResource, delta : float) -> void:
	cuerpo_obstaculo.position += calcular_movV_desc(obstaculo) * delta
	cuerpo_obstaculo.position += calcular_movH(obstaculo) * delta
	
	if cuerpo_obstaculo.global_position.x < 75 or cuerpo_obstaculo.global_position.x > 451:
		print("gatete out of bounds")
		cambio_sentido()

func _on_desc_gatete_body_entered(nodo):
	cambio_sentido()

func _on_desc_gatete_area_entered(area: Area2D) -> void:
	cambio_sentido()
