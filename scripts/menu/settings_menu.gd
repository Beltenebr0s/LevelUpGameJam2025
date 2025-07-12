extends Control

func _ready():
	$Volume.value = AudioManager.porcentaje_master
	$Volume_button.button_pressed = AudioManager.master_muted

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


func _on_volume_value_changed(value: float) -> void:
	AudioManager.change_master_volume(value)


func _on_volume_button_toggled(toggled_on: bool) -> void:
	AudioManager.mute_master(toggled_on)
