extends Control


func _on_es_pressed():
	TranslationServer.set_locale("es")

func _on_en_pressed():
	TranslationServer.set_locale("en")
