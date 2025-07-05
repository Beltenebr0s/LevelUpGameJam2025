@tool
extends AnimationPlayer

@export var has_fadein : bool
@export var fadeout_animation : Animation
@export var fadein_animation : Animation

func _enter_tree():
	connect_all_nav_buttons()
	if (has_fadein):
		play_fadein_animation()

func connect_all_nav_buttons():
	var navigation_button_list = get_tree().get_nodes_in_group("NavButton")
	for object in navigation_button_list:
		var nav_button : NavigationButton = object
		if nav_button.has_transition:
			nav_button.transition_to_scene.connect(play_fadeout_animation)
	
func play_fadeout_animation(nextScene : PackedScene):
	await play(fadeout_animation.resource_name)
	get_tree().change_scene_to_packed(nextScene)
	
func play_fadein_animation():
	await play(fadein_animation.resource_name)
