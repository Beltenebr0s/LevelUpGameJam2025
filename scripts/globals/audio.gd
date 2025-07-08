extends Node

@export var vol_min : float = -20
@export var vol_max : float = 10

var porcentaje_master : float = 66
var porcentaje_musica : float = 44
var porcentaje_sfx : float = 44
var master_muted : bool = false
var musica_muted : bool = false
var sfx_muted : bool = false

var ratio : float

var master_bus = AudioServer.get_bus_index("Master")
var music_bus = AudioServer.get_bus_index("Musica")
var sfx_bus = AudioServer.get_bus_index("SFX")

var tween : Tween

@onready var boton_select = $SFX/Menus/BotonSelect
@onready var boton_down = $SFX/Menus/BotonDown
@onready var boton_pressed = $SFX/Menus/BotonPressed
@onready var ascensor = $SFX/Menus/Ascensor

func _ready():
	ratio = (abs(vol_max) + abs(vol_min))/100
	
	change_master_volume(porcentaje_master)
	change_music_volume(porcentaje_musica)
	change_sfx_volume(porcentaje_sfx)

func change_master_volume(_volumen : float):
	porcentaje_master = _volumen
	AudioServer.set_bus_volume_db(master_bus, vol_min + porcentaje_master * ratio)
func mute_master(_toggled_on : bool):
	master_muted = _toggled_on
	AudioServer.set_bus_mute(master_bus, master_muted)

func change_music_volume(_volumen : float):
	porcentaje_musica = _volumen
	AudioServer.set_bus_volume_db(music_bus, vol_min + porcentaje_musica * ratio)
func mute_music(_toggled_on : bool):
	musica_muted = _toggled_on
	AudioServer.set_bus_mute(music_bus, musica_muted)

func change_sfx_volume(_volumen : float):
	porcentaje_sfx = _volumen
	AudioServer.set_bus_volume_db(sfx_bus, vol_min + porcentaje_sfx * ratio)
func mute_sfx(_toggled_on : bool):
	sfx_muted = _toggled_on
	AudioServer.set_bus_mute(sfx_bus, sfx_muted)

func play_boton_select():
	print("FUI SELECCIONADO")
	boton_select.play()

func play_boton_down():
	boton_down.play()

func play_boton_pressed():
	boton_pressed.play()

func play_ascensor():
	ascensor.play()
