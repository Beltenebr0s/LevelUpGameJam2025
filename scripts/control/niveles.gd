extends Node

@export var duracion_nivel_endless : float = 15
@export var mult_intervalo_endless : float = 0.8
@export var mult_velocidad_endless : float = 1.3
@export var lista_niveles : Array[NivelResource]
signal nivel_cambiado(nuevo_nivel : NivelResource)
signal piso_cambiado(nuevo_piso : int)

var nivel_actual : int = 0
var ultimo_nivel : NivelResource
var piso_actual : int = 100

var piso_nivel_anterior : int = 100

func _ready():
	nivel_cambiado.emit(lista_niveles[nivel_actual])
	$Timer.start()

func _on_timer_timeout():
	piso_actual -= 1
	piso_cambiado.emit(piso_actual)
	
	if (piso_nivel_anterior - piso_actual == lista_niveles[nivel_actual].duracion):
		piso_nivel_anterior = piso_actual
		nivel_actual += 1
		nivel_cambiado.emit(lista_niveles[nivel_actual])
	
