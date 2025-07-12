extends Node2D

@onready var score = 0
@export var game_over_scene_path : String = "res://scenes/menus/game_over_menu.tscn"
@export var initial_scroll_speed : float = 100

func _ready():
	AudioManager.play_game_music()
	GlobalVars.is_first_game = false
	GlobalVars.mult = 1
	GlobalVars.scroll_speed = initial_scroll_speed
	conectar_spawns()
	score = 0
	$PauseMenu.visible = false
	$HUD.next_level(100)
	
func  _process(delta):
	score += delta
	
func conectar_spawns():
	var spawns_obstaculos = $SpawnController.find_children("*", "Spawn")
	for spawn : Spawn in spawns_obstaculos:
		spawn.obstaculo_creado.connect(nuevo_obstaculo)
	
func nuevo_obstaculo(obs : Obstaculo):
	obs.collided_with_player.connect(jugador_chocado)
	
func jugador_chocado():
	await $Jugador.game_over()
	GlobalVars.final_score = int(score)
	get_tree().paused = true
	$PauseButton.hide()
	$TransitionManager.play_fadeout_animation(game_over_scene_path)

func _on_niveles_nivel_cambiado(nuevo_nivel : NivelResource):
	$SpawnController.actualizar_dificultad(nuevo_nivel)

func _on_transition_scene_transition_finished():
	$PauseButton.show()

func _on_niveles_piso_cambiado(nuevo_piso):
	$HUD.next_level(nuevo_piso)

func _on_jugador_actualizar_ui_dash(b_enable):
	$HUD.set_dash_visibility(b_enable)
