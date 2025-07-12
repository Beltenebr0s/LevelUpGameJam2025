class_name Spawn
extends Path2D

var vecinos_disponibles : Array[PackedScene]

signal obstaculo_creado(nuevo_obstaculo : Obstaculo)

func _process(delta):
	movimiento_por_el_loop(delta)

func spawn():
	if not vecinos_disponibles.is_empty():
		var escena_vecino = vecinos_disponibles.pick_random()
		var vecino_instanciado = escena_vecino.instantiate()
		var spawn_location = get_node("SpawnLocation")
		vecino_instanciado.position = spawn_location.position
		obstaculo_creado.emit(vecino_instanciado)
		add_child(vecino_instanciado)
	else:
		print("Spawn sin vecinos disponibles")

func movimiento_por_el_loop(delta):
	$SpawnLocation.progress_ratio += delta * 0.2
