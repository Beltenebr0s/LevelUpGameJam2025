@tool
extends Button
class_name NavigationButton

@export var next_scene_path: String
@export var has_transition: bool
signal transition_to_scene(next : String)

func _enter_tree():
	add_to_group("NavButton")
	pressed.connect(on_button_clicked)

func on_button_clicked():
	if (next_scene_path != ""):
		if (has_transition):
			transition_to_scene.emit(next_scene_path)
		else:
			SceneManager.change_to_scene(next_scene_path)
	else:
		print("No tengo siguiente escena :0")
