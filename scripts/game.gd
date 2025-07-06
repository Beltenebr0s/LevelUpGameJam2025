extends Node2D

@onready var score = 0
@export var game_over_scene_path : String = "res://scenes/menus/game_over_menu.tscn"

func _ready():
	GlobalVars.is_first_game = false
	conectar_spawns()
	score = 0
	
func  _process(delta):
	score += delta

func conectar_spawns():
	var spawns_obstaculos = $Spawns.get_children()
	for spawn : Spawn in spawns_obstaculos:
		spawn.obstaculo_creado.connect(nuevo_obstaculo)
	
func nuevo_obstaculo(obs : Obstaculo):
	obs.collided_with_player.connect(jugador_chocado)
	
func jugador_chocado():
	GlobalVars.final_score = int(score)
	await get_tree().create_timer(1.0).timeout
	SceneManager.change_to_scene(game_over_scene_path)
