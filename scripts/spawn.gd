class_name Spawn
extends Marker2D

@export var activated : bool = false
@export var escena_obstaculo : PackedScene
@export var tiempo : float = 3

signal obstaculo_creado(nuevo_obstaculo : Obstaculo)

func _ready():
	$Timer.wait_time = tiempo
	if activated:
		$Timer.start()
	
func spawn_obstacle():
	var obstaculo : Obstaculo = escena_obstaculo.instantiate()
	obstaculo.position = global_position
	obstaculo_creado.emit(obstaculo)
	add_child(obstaculo)

func _on_timer_timeout():
	spawn_obstacle()

func start_timer():
	$Timer.start()

func stop_timer():
	$Timer.stop()
