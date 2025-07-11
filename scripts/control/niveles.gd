extends Node

@export var duracion_inf : float = 15
@export var mult_int_inf : float = 0.8
@export var mult_vel_inf : float = 1.3
signal nivel_cambiado(nuevo_nivel : int)
signal piso_cambiado(nuevo_piso : int)

var nivel_actual : int = 0
var ultimo_nivel : NivelResource
var piso_actual : int = 100

func _ready():
	$Timer.start()

func _on_timer_timeout():
	piso_actual -= 1
	piso_cambiado.emit(piso_actual)
	
	if (piso_actual % 5 == 0):
		nivel_actual += 1
		nivel_cambiado.emit(nivel_actual)
	
	#nivel_actual += 1
	#if nivel_actual < len(niveles):
		#$Timer.start(niveles[nivel_actual].duracion)
		#nivel_cambiado.emit(niveles[nivel_actual])
		#
	#else:
		#$Timer.start(duracion_inf)
		#ultimo_nivel.intervaloSpawns *= mult_int_inf
		#ultimo_nivel.multVelocidad *= mult_vel_inf
		#nivel_cambiado.emit(ultimo_nivel)
	#print(		"Nivel ", nivel_actual)
