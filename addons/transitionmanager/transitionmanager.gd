@tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("TransitionManager", "AnimationPlayer", preload("trans_mgr.gd"), preload("icon.png"))
	pass


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("TransitionManager")
	pass
