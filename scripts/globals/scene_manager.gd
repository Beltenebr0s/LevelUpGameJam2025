extends Node

var current_scene = null

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(-1)
	
func change_to_scene(path):
	deferred_change_to_scene.call_deferred(path)

func deferred_change_to_scene(path):
	if path == "exitgame":
		get_tree().quit()
		return
	current_scene.free()
	var new_scene = ResourceLoader.load(path)
	current_scene = new_scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
