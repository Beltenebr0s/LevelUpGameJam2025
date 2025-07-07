@tool
extends AnimationPlayer

@export var has_fadein : bool
@export var transition_scene : TransitionScene

func _ready():
	connect_all_nav_buttons()
	if (has_fadein):
		play_fadein_animation()

func connect_all_nav_buttons():
	var navigation_button_list = get_tree().get_nodes_in_group("NavButton")
	for object in navigation_button_list:
		var nav_button : NavigationButton = object
		if nav_button.has_transition:
			nav_button.transition_to_scene.connect(play_fadeout_animation)
	
func play_fadeout_animation(nextScene : String):
	print("play fadout")
	transition_scene.play_anim("fade_out")
	await transition_scene.transition_finished
	SceneManager.change_to_scene(nextScene)
	
func play_fadein_animation():
	print("play fadein")
	transition_scene.play_anim("fade_in")
	
