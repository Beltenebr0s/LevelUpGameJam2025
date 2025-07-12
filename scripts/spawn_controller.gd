extends Node

@export var intervalo_spawns : float = 2

var spawn_points_arriba : Array
var spawn_points_abajo : Array
var spawn_points : Array

func _ready():
	spawn_points_arriba = $SpawnsArriba.find_children("*", "Spawn")
	spawn_points_abajo = $SpawnsAbajo.find_children("*", "Spawn")
	spawn_points.append_array(spawn_points_arriba)
	spawn_points.append_array(spawn_points_abajo)
	timer_start()

func timer_start():
	$Timer.start(intervalo_spawns)

func timer_stop():
	$Timer.stop()

func _on_timer_timeout():
	spawn_points.shuffle()
	for spawn in spawn_points:
		if spawn.spawn():
			break
	timer_start()

func actualizar_dificultad(nuevo_nivel : NivelResource):
	intervalo_spawns = nuevo_nivel.intervaloSpawns
	for spawner in spawn_points_arriba:
		spawner.vecinos_disponibles = nuevo_nivel.vecinosDes
	for spawner in spawn_points_abajo:
		spawner.vecinos_disponibles = nuevo_nivel.vecinosAsc
