extends Node

@onready var is_first_game : bool = true
@onready var final_score : int = 0
@onready var mult : float = 1
@onready var lista_vecinos : Array[ObstacleResource]

func add_vecino(vecino_nuevo):
	if lista_vecinos.find(vecino_nuevo) == -1:
		print("Vecino nuevo: " + vecino_nuevo.nombre)
		lista_vecinos.append(vecino_nuevo)

func desbloquear_vecino(vecino_nuevo : ObstacleResource):
	var indice_vecino = lista_vecinos.find(vecino_nuevo)
	if (indice_vecino > -1):
		print("Vecino desbloqueado: " + vecino_nuevo.nombre)
		lista_vecinos[indice_vecino].desbloqueado = true
