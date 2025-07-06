extends Node

@export var time : float = 2

var spawn_points : Array
var num_spawns : int = 1

func _ready():
	spawn_points = find_children("*", "Marker2D")
	print(		"--Spawn Points:", spawn_points)
	timer_start()

func timer_start():
	$Timer.start(time)

func timer_stop():
	$Timer.stop()

func _on_timer_timeout():
	spawn_points.shuffle()
	for spawner in  spawn_points.slice(0, num_spawns):
		spawner.spawn_obstacle()
	timer_start()
