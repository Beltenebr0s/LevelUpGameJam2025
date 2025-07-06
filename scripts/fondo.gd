extends Sprite2D

signal volver_al_inicio(fondo : Sprite2D)

func _on_visible_on_screen_notifier_2d_screen_exited():
	volver_al_inicio.emit(self)
