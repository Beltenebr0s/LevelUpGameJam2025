class_name TransitionScene
extends Control

@onready var player = $AnimationPlayer
signal transition_finished
func _enter_tree():
	player = get_child(0)
	print(player)

func play_anim(animation_name : String):
	get_tree().paused = true
	player.play(animation_name)
	await player.animation_finished
	get_tree().paused = false
	transition_finished.emit()
