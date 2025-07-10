extends Control

func next_level(new_level : int):
	$Nivel/LblNum.text = str(new_level)
	$UiAnimations.play("next_level")
