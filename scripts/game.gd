extends Node2D

@onready var score = 0
@export var game_over_scene_path : String = "res://scenes/menus/game_over_menu.tscn"

func _ready():
	GlobalVars.is_first_game = false
	conectar_spawns()
	score = 0
	
func  _process(delta):
	score += delta
	GlobalVars.mult_global += delta / 10
	
func conectar_spawns():
	var spawns_obstaculos = $SpawnController.find_children("*", "Spawn")
	for spawn : Spawn in spawns_obstaculos:
		spawn.obstaculo_creado.connect(nuevo_obstaculo)
	
func nuevo_obstaculo(obs : Obstaculo):
	obs.collided_with_player.connect(jugador_chocado)
	
func jugador_chocado():
	GlobalVars.final_score = int(score)
	get_tree().paused = true
	$TransitionManager.play_fadeout_animation(game_over_scene_path)

func _on_niveles_nivel_cambiado(int_spawns: float, num_spawns: int):
	$SpawnController.actualizar_dificultad(int_spawns, num_spawns)
