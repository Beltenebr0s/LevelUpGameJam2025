class_name Spawn
extends Marker2D

@export var activated : bool = false
@export var vecinos : Array[PackedScene]

var lista_pesos : Array[float]

signal obstaculo_creado(nuevo_obstaculo : Obstaculo)

func _ready():
	crear_lista_pesos()
	
func spawn_obstacle():
	var escena_obstaculo = escoger_vecino()
	var obstaculo : Obstaculo = escena_obstaculo.instantiate()
	obstaculo_creado.emit(obstaculo)
	add_child(obstaculo)
	print(		"Spawneado ", obstaculo.name, " en el nodo ", name, " en ", obstaculo.position)

func crear_lista_pesos():
	var peso_max = 0
	var vecino_instanciado : Obstaculo
	for vecino in vecinos:
		vecino_instanciado = vecino.instantiate()
		peso_max += vecino_instanciado.obstacleResource.peso
	for vecino in vecinos:
		vecino_instanciado = vecino.instantiate()
		if len(lista_pesos) == 0:
			lista_pesos.append(vecino_instanciado.obstacleResource.peso / peso_max)
		else:
			lista_pesos.append(lista_pesos[len(lista_pesos) - 1] + vecino_instanciado.obstacleResource.peso / peso_max)
	print(lista_pesos)

func escoger_vecino():
	var i = 0
	var random = randf()
	for valor in lista_pesos:
		if random <= valor:
			print(random, " - ", vecinos[i])
			return vecinos[i]
		i += 1
