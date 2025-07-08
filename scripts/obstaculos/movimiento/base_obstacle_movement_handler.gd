class_name  BaseObstacleMovement
extends Node

var random_mult = randf_range(-1, 1)
var sentido = [-1, 1].pick_random()

func move(cuerpo_obstaculo : Area2D, obstaculo : ObstacleResource , delta : float) -> void:
	print("Hola me estás pidiendo que me mueva pero soy la clase base yo no implemento nada")

func calcular_movV_desc(obstaculo : ObstacleResource):
	var dirV = Vector2.DOWN
	dirV *= obstaculo.velocidad * GlobalVars.mult
	dirV *= 1 + random_mult * obstaculo.variablidadVelocidadMax
	return dirV

func calcular_movV_asc(obstaculo : ObstacleResource):
	var dirV = Vector2.UP
	dirV *= obstaculo.velocidad * GlobalVars.mult
	dirV *= 1 + random_mult * obstaculo.variablidadVelocidadMax
	return dirV

func calcular_movH(obstaculo : ObstacleResource):
	var dirH = Vector2.RIGHT
	dirH *= obstaculo.velocidadHorizontal * sentido
	return dirH

func calcular_mov_escalera():
	var dirV = Vector2.UP
	dirV *= GlobalVars.scroll_speed
	return dirV

func cambio_sentido():
	sentido *= -1
