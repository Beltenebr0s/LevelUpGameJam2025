extends Control

func next_level(new_level : int):
	$Nivel/LblNum.text = str(new_level)
	$UiAnimations.play("next_level")

func set_dash_visibility(b_enabled : bool):
	var alfa_icono = 1 if b_enabled else 0.5
	var alfa_aura = 1 if b_enabled else 0
	$TextureRect.modulate = Color(1, 1, 1, alfa_aura)
	$UIDash.modulate = Color(1, 1, 1, alfa_icono)
