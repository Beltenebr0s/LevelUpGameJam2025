extends Control

@export var censoVecinos : Array[ObstacleResource]

const intro_scene_path : String = "res://scenes/menus/intro.tscn"
const game_scene_path : String = "res://scenes/game_scene.tscn"

func _ready():
	AudioManager.play_menu_music()
	$Botones/Salir.visible = OS.get_name() != "Web"
	for vecino in censoVecinos:
		GlobalVars.add_vecino(vecino)
	$Background/Lucecitas.play("light")


func _on_play_pressed():
	if GlobalVars.is_first_game:
		$TransitionManager.play_fadeout_animation(intro_scene_path)
	else:
		$TransitionManager.play_fadeout_animation(game_scene_path)


func _on_play_mouse_entered():
	$Play.rotation_degrees = 5.0

func _on_play_mouse_exited():
	$Play.rotation_degrees = 0.0
