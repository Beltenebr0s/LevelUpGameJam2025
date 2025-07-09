@tool
extends Button
class_name NavigationButton

@export var next_scene_path: String
@export var has_transition: bool

var navegacion_funcional : bool = true

signal transition_to_scene(next : String)

func _enter_tree():
	add_to_group("NavButton")
	pressed.connect(on_button_clicked)
	mouse_entered.connect(AudioManager.play_boton_select)
	button_down.connect(AudioManager.play_boton_down)
	pressed.connect(AudioManager.play_boton_pressed)

func on_button_clicked():
	if (next_scene_path != "") and navegacion_funcional:
		if (has_transition):
			transition_to_scene.emit(next_scene_path)
		else:
			SceneManager.change_to_scene(next_scene_path)
	else:
		print("No tengo siguiente escena :0")
