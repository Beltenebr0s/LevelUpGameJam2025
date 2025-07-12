extends Node

@export var duracion_nivel_endless : float = 15
@export var mult_intervalo_endless : float = 0.9
@export var mult_velocidad_endless : float = 1.1
@export var lista_niveles : Array[NivelResource]
@export var ultimo_nivel : NivelResource
signal nivel_cambiado(nuevo_nivel : NivelResource)
signal piso_cambiado(nuevo_piso : int)

var num_nivel_actual : int = 0
var nivel_actual : NivelResource
var piso_actual : int = 100

var piso_nivel_anterior : int = 100

func _ready():
	nivel_actual = lista_niveles[num_nivel_actual]
	nivel_cambiado.emit(nivel_actual)
	$Timer.start()

func _on_timer_timeout():
	piso_actual -= 1
	piso_cambiado.emit(piso_actual)
	GlobalVars.scroll_speed *= 1.02
	print(		"Velocidad escaleras: ",GlobalVars.scroll_speed)
	
	if (piso_nivel_anterior - piso_actual == nivel_actual.duracion):
		piso_nivel_anterior = piso_actual
		num_nivel_actual += 1
		if(num_nivel_actual < len(lista_niveles)):
			nivel_actual = lista_niveles[num_nivel_actual]
		else:
			actualizar_ultimo_nivel(lista_niveles.pick_random())
			nivel_actual = ultimo_nivel
		nivel_cambiado.emit(nivel_actual)

func actualizar_ultimo_nivel(nivel_plantilla_spawns : NivelResource):
	ultimo_nivel.vecinosAsc = nivel_plantilla_spawns.vecinosAsc
	ultimo_nivel.vecinosDes = nivel_plantilla_spawns.vecinosDes
	ultimo_nivel.intervaloSpawns *= mult_intervalo_endless
	ultimo_nivel.multVelocidad *= mult_velocidad_endless
	
