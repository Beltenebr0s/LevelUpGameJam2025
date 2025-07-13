extends Control

func _ready():
	connect_button_sounds($Pagina1/Next)
	connect_button_sounds($Pagina2/Play)
	
	$Pagina1.show()
	$Pagina2.hide()

func _on_next_pressed():
	$Pagina1.hide()
	$Pagina2.show()
	
func connect_button_sounds(but : Button):
	but.mouse_entered.connect(AudioManager.play_boton_select)
	but.pressed.connect(AudioManager.play_boton_pressed)
