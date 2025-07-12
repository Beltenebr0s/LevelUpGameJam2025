extends Control

@onready var foto_vecino = $Panel/FotoVecino
@export var vecino_bloqueado : Texture
@onready var indice_vecino : int = 0
@onready var vecinos_totales : int = len(GlobalVars.lista_vecinos)
func _ready():
	colocar_vecino()
	pass
	
func colocar_vecino():
	var vecino = GlobalVars.lista_vecinos[indice_vecino]
	if vecino.desbloqueado:
		foto_vecino.texture = vecino.textura_ui
		$NombreVecinos.text = tr(vecino.nombre)
	else:
		foto_vecino.texture = vecino_bloqueado
		$NombreVecinos.text = "?????"


func _on_back_pressed():
	if (indice_vecino == 0):
		indice_vecino = vecinos_totales
	indice_vecino -= 1
	colocar_vecino()

func _on_next_pressed():
	if (indice_vecino == vecinos_totales - 1):
		indice_vecino = -1
	indice_vecino += 1
	colocar_vecino()
