extends Control

func next_level(new_level : int):
	$Nivel/LblNum.text = str(new_level)
	$UiAnimations.play("next_level")

func set_dash_visibility(b_enabled : bool):
	var alfa = 1 if b_enabled else 0.5
	$UIDash.modulate = Color(1, 1, 1, alfa)
