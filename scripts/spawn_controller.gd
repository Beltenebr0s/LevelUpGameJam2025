extends Node

@export var intervalo_spawns : float = 2
@export var numero_spawns : int = 1

var spawn_points : Array
var num_spawns : int = 1

func _ready():
	spawn_points = find_children("*", "Marker2D")
	print(		"--Spawn Points:", spawn_points)
	timer_start()

func timer_start():
	$Timer.start(intervalo_spawns)

func timer_stop():
	$Timer.stop()

func _on_timer_timeout():
	spawn_points.shuffle()
	for spawner in  spawn_points.slice(0, numero_spawns):
		spawner.spawn_obstacle()
	timer_start()

func actualizar_dificultad(int_spawns : float, num_spawns : int):
	intervalo_spawns = int_spawns
	numero_spawns = num_spawns
	print(		"Nueva dificultad: ", intervalo_spawns, numero_spawns)
