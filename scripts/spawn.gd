class_name Spawn
extends Path2D

@export var vecinos_totales : Array[PackedScene]

var vecinos_disponibles : Array[PackedScene]
var nivel_actual = 0

signal obstaculo_creado(nuevo_obstaculo : Obstaculo)

func _ready():
	crear_lista_vecinos_disponibles()
	
func crear_lista_vecinos_disponibles():
	vecinos_disponibles = []
	for vecinito in vecinos_totales:
		var instancia : Obstaculo = vecinito.instantiate()
		if nivel_actual >= instancia.obstacleResource.nivel_dificultad_minimo:
			vecinos_disponibles.append(vecinito)
		instancia.free()
	
func spawn():
	var escena_vecino = elegir_vecino()
	if escena_vecino != null:
		var vecino_instanciado = escena_vecino.instantiate()
		var spawn_location = get_node("SpawnLocation")
		spawn_location.progress_ratio = randf()
		vecino_instanciado.position = spawn_location.position
		obstaculo_creado.emit(vecino_instanciado)
		add_child(vecino_instanciado)
	else:
		print("Spawn sin vecinos disponibles")
	
func elegir_vecino() -> PackedScene:
	return vecinos_disponibles.pick_random()
