extends Node

@export var duracion_inf : float = 15
@export var mult_int_inf : float = 0.8
@export var mult_vel_inf : float = 1.3
@export var niveles : Array[NivelResource]
signal nivel_cambiado(nuevo_nivel : NivelResource)

var nivel_actual : int = 0
var ultimo_nivel : NivelResource

func _ready():
	$Timer.start(niveles[0].duracion)
	ultimo_nivel = niveles[len(niveles) - 1]

func _on_timer_timeout():
	nivel_actual += 1
	if nivel_actual < len(niveles):
		$Timer.start(niveles[nivel_actual].duracion)
		nivel_cambiado.emit(niveles[nivel_actual])
		
	else:
		$Timer.start(duracion_inf)
		ultimo_nivel.intervaloSpawns *= mult_int_inf
		ultimo_nivel.multVelocidad *= mult_vel_inf
		nivel_cambiado.emit(ultimo_nivel)
	print(		"Nivel ", nivel_actual)
