extends Control

@onready var comunidad_vecinos = $MarginContainer/VBoxContainer/ScrollContainer/ImagenesVecinos
var lista_imagenes
@export var vecino_bloqueado : Texture
func _ready():
	lista_imagenes = comunidad_vecinos.find_children("*", "TextureRect")
	colocar_vecinos()
	pass
	
func colocar_vecinos():
	var i = 0
	for vecino in GlobalVars.lista_vecinos:
		var foto_vecino : TextureRect = TextureRect.new()
		comunidad_vecinos.add_child(foto_vecino)
		if vecino.desbloqueado:
			foto_vecino.texture = vecino.textura
		else:
			foto_vecino.texture = vecino_bloqueado
		i += 1
