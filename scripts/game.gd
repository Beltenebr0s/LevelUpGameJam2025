extends Node2D

@onready var score = 0
@export var game_over_scene_path : String = "res://scenes/menus/game_over_menu.tscn"

func _ready():
	GlobalVars.is_first_game = false
	conectar_spawns()
	score = 0
	$PauseMenu.visible = false
	
func  _process(delta):
	score += delta
	
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

func _on_niveles_nivel_cambiado(nuevo_nivel : NivelResource):
	$SpawnController.actualizar_dificultad(nuevo_nivel.intervaloSpawns, nuevo_nivel.numSpawns)
	GlobalVars.mult = nuevo_nivel.multVelocidad
	print(		"Nueva dificultad: ", nuevo_nivel.intervaloSpawns, " - ", nuevo_nivel.numSpawns, " - ", nuevo_nivel.multVelocidad)


func _on_transition_scene_transition_finished():
	$PauseButton.show()
