class_name Spawn
extends Marker2D

@export var activated : bool = false
@export var desp_horizontal : int = 50
@export var vecinos : Array[PackedScene]

signal obstaculo_creado(nuevo_obstaculo : Obstaculo)

func _ready():
	pass
	
func spawn_obstacle():
	var escena_obstaculo = vecinos.pick_random()
	var obstaculo : Obstaculo = escena_obstaculo.instantiate()
	var hor = Vector2.RIGHT * desp_horizontal
	var rand = randf_range(-1, 1)
	obstaculo.position = global_position # + hor * rand
	obstaculo_creado.emit(obstaculo)
	add_child(obstaculo)
	print(		"Spawneado ", obstaculo.name, " en el nodo ", name, " en ", obstaculo.position)
