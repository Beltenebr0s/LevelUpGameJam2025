extends Control

func _ready():
	$Pagina1.show()
	$Pagina2.hide()

func _on_next_pressed():
	$Pagina1.hide()
	$Pagina2.show()
