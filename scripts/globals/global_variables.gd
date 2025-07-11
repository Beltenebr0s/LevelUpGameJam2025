extends Node

@onready var is_first_game : bool = true
@onready var final_score : int = 0
@onready var mult : float = 1
@onready var scroll_speed : float = 100
@onready var lista_vecinos : Array[ObstacleResource]

func add_vecino(vecino_nuevo):
	if lista_vecinos.find(vecino_nuevo) == -1:
		lista_vecinos.append(vecino_nuevo)

func desbloquear_vecino(vecino_nuevo : ObstacleResource):
	var indice_vecino = lista_vecinos.find(vecino_nuevo)
	if (indice_vecino > -1):
		lista_vecinos[indice_vecino].desbloqueado = true

func _ready():
	SilentWolf.configure({
		"api_key": "NBlyZMvWWBazaxpwTHc2A1mJjs0gOVDg8UAhmy7I",
		"game_id": "stairwaytohall",
		"log_level": 1
	})
	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/MainPage.tscn"
	})
