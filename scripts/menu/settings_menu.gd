extends Control


func no_destruir_escena():
	var navigation_button_list = []
	for node in get_tree().get_nodes_in_group("NavButton"):
		if is_ancestor_of(node):
			navigation_button_list.append(node)
	for nav_button in navigation_button_list:
		nav_button.navegacion_funcional = false
		nav_button.pressed.connect(eliminar_escena)

func eliminar_escena():
	queue_free()

func _on_es_pressed():
	TranslationServer.set_locale("es")

func _on_en_pressed():
	TranslationServer.set_locale("en")
