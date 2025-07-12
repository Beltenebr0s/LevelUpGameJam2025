extends Node2D

var background_height: float

func _ready():
	background_height = $Fondo1.texture.get_height() * $Fondo1.scale.y

func _process(delta):
	$Fondo1.position.y -= GlobalVars.scroll_speed * delta
	$Fondo2.position.y -= GlobalVars.scroll_speed * delta
	$Fondo3.position.y -= GlobalVars.scroll_speed * delta

	if $Fondo1.position.y <= - background_height:
		$Fondo1.position.y = $Fondo3.position.y + background_height


	if $Fondo2.position.y <= - background_height:
		$Fondo2.position.y= $Fondo1.position.y + background_height

	if $Fondo3.position.y <= - background_height:
		$Fondo3.position.y = $Fondo2.position.y + background_height
