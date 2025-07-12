class_name Spawn
extends Path2D

var vecinos_disponibles : Array[PackedScene]

signal obstaculo_creado(nuevo_obstaculo : Obstaculo)

func _process(delta):
	#movimiento_por_el_loop(delta)
	pass

func spawn() -> bool:
	if not vecinos_disponibles.is_empty():
		var escena_vecino = vecinos_disponibles.pick_random()
		var vecino_instanciado = escena_vecino.instantiate()
		var spawn_location = get_node("SpawnLocation")
		spawn_location.progress_ratio = randf()
		vecino_instanciado.position = spawn_location.position
		obstaculo_creado.emit(vecino_instanciado)
		add_child(vecino_instanciado)
		return true
	else:
		print("No hay vecinos disponibles para spawnear")
		return false

func movimiento_por_el_loop(delta):
	$SpawnLocation.progress_ratio += delta * 0.2
