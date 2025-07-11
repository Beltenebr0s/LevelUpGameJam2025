extends Node

@export var intervalo_spawns : float = 2

var spawn_points : Array

func _ready():
	spawn_points = find_children("*", "Spawn")
	print(		"--Spawn Points:", spawn_points)
	timer_start()

func timer_start():
	$Timer.start(intervalo_spawns)

func timer_stop():
	$Timer.stop()

func _on_timer_timeout():
	spawn_points.shuffle()
	spawn_points[0].spawn()
	timer_start()

func actualizar_dificultad(nuevo_invel):
	for spawner in spawn_points:
		spawner.nivel_actual = nuevo_invel
		spawner.crear_lista_vecinos_disponibles()
