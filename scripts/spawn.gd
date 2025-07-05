extends Marker2D

@export var activated : bool = false
@export var escena_obstaculo : PackedScene

func _ready():
	
	if activated:
		$Timer.start()
	
func spawn_obstacle():
	var obstaculo = escena_obstaculo.instantiate()
	obstaculo.position = position
	add_child(obstaculo)

func _on_timer_timeout():
	spawn_obstacle()

func start_timer():
	$Timer.start()

func stop_timer():
	$Timer.stop()
