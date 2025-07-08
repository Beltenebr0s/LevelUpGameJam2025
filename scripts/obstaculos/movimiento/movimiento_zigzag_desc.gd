class_name MovimientoZigzagDesc
extends BaseObstacleMovement

var sentido = [-1, 1].pick_random()

func move(cuerpo_obstaculo : Area2D, obstaculo : ObstacleResource, delta : float) -> void:
	var dir = Vector2.DOWN
	var movV = dir * obstaculo.velocidad * GlobalVars.mult * delta
	# var movEscalera = dir * GlobalVars.scroll_speed * delta
	cuerpo_obstaculo.position += movV
	var dirH = Vector2.RIGHT
	var movH = dirH * obstaculo.velocidadHorizontal * sentido * delta
	cuerpo_obstaculo.position += movH
	
	if cuerpo_obstaculo.global_position.x < 75 or cuerpo_obstaculo.global_position.x > 451:
		print("gatete out of bounds")
		cambio_sentido()

func cambio_sentido():
	sentido *= -1

func _on_desc_gatete_body_entered(nodo):
	cambio_sentido()

func _on_desc_gatete_area_entered(area: Area2D) -> void:
	cambio_sentido()
