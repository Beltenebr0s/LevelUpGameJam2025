extends Control

@export var settings_menu : PackedScene

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if get_tree().paused == true:
			resume()
		else:
			pause()

func pause():
	process_mode = Node.PROCESS_MODE_ALWAYS
	get_tree().paused = true
	visible = true

func resume():
	get_tree().paused = false
	process_mode = Node.PROCESS_MODE_INHERIT
	visible = false

func _on_settings_pressed():
	var settings_menu_inst = settings_menu.instantiate()
	add_child(settings_menu_inst)
	settings_menu_inst.no_destruir_escena()

func _on_play_pressed():
	resume()
