extends Control

@export var censoVecinos : Array[ObstacleResource]

const intro_scene_path : String = "res://scenes/menus/intro.tscn"
const game_scene_path : String = "res://scenes/game_scene.tscn"

func _ready():
	var navigation_button_list = get_tree().get_nodes_in_group("NavButton")
	for object in navigation_button_list:
		var nav_button : NavigationButton = object
		nav_button.pressed.connect(turn_off_lights)
			
	$Play.mouse_entered.connect(AudioManager.play_boton_select)
	$Play.button_down.connect(AudioManager.play_boton_down)
	$Play.pressed.connect(AudioManager.play_boton_pressed)
	
	AudioManager.play_menu_music()
	$Botones/Salir.visible = OS.get_name() != "Web"
	for vecino in censoVecinos:
		GlobalVars.add_vecino(vecino)
	$Background/Lamp1/PointLight2D.visible = false
	$Background/Lamp2/PointLight2D.visible = false
	await $TransitionScene/AnimationPlayer.animation_finished
	$Background/Lucecitas.play("light")
	$Background/Lamp1/PointLight2D.visible = true
	$Background/Lamp2/PointLight2D.visible = true


func _on_play_pressed():
	if GlobalVars.is_first_game:
		$TransitionManager.play_fadeout_animation(intro_scene_path)
	else:
		$TransitionManager.play_fadeout_animation(game_scene_path)

func turn_off_lights():
	$Background/Lamp1/PointLight2D.visible = false
	$Background/Lamp2/PointLight2D.visible = false

func _on_play_mouse_entered():
	$Play.rotation_degrees = 5.0

func _on_play_mouse_exited():
	$Play.rotation_degrees = 0.0
