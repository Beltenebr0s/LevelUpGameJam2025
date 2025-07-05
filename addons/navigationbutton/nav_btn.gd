@tool
extends Button
class_name NavigationButton

@export var next_scene: PackedScene
@export var has_transition: bool
signal transition_to_scene(next : PackedScene)

func _enter_tree():
	add_to_group("NavButton")
	pressed.connect(on_button_clicked)

func on_button_clicked():
	if (next_scene != null):
		if (has_transition):
			transition_to_scene.emit(next_scene)
		else:
			get_tree().change_scene_to_packed(next_scene)
	else:
		print("No tengo siguiente escena :0")
