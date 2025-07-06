extends Node2D
@export var scroll_speed: float = 100.0

func _ready():
	$Fondo1.volver_al_inicio.connect(restaurar_posicion)
	$Fondo2.volver_al_inicio.connect(restaurar_posicion)
	$Fondo3.volver_al_inicio.connect(restaurar_posicion)

func _process(delta):
	$Fondo1.position.y -= scroll_speed * delta
	$Fondo2.position.y -= scroll_speed * delta
	$Fondo3.position.y -= scroll_speed * delta

func restaurar_posicion(fondo : Sprite2D):
	fondo.position = $Inicio.position
