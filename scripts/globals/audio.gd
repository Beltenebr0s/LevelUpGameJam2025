extends Node

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

@export var gameplay_music : AudioStreamPlayer
@export var boton_select : AudioStreamPlayer
@export var boton_pressed : AudioStreamPlayer
@export var ascensor : AudioStreamPlayer

func _ready():
	change_master_volume(porcentaje_master)
	change_music_volume(porcentaje_musica)
	change_sfx_volume(porcentaje_sfx)

func change_master_volume(_volumen : float):
	porcentaje_master = _volumen
	AudioServer.set_bus_volume_db(master_bus, linear_to_db(porcentaje_master/100))
func mute_master(_toggled_on : bool):
	master_muted = _toggled_on
	AudioServer.set_bus_mute(master_bus, master_muted)

func change_music_volume(_volumen : float):
	porcentaje_musica = _volumen
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(porcentaje_musica/100))
func mute_music(_toggled_on : bool):
	musica_muted = _toggled_on
	AudioServer.set_bus_mute(music_bus, musica_muted)

func change_sfx_volume(_volumen : float):
	porcentaje_sfx = _volumen
	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(porcentaje_sfx/100))
func mute_sfx(_toggled_on : bool):
	sfx_muted = _toggled_on
	AudioServer.set_bus_mute(sfx_bus, sfx_muted)

func play_game_music():
	ascensor.stop()
	if not gameplay_music.playing:
		gameplay_music.play()

func play_boton_select():
	boton_select.play()

func play_boton_pressed():
	boton_pressed.play()

func play_menu_music():
	gameplay_music.stop()
	if not ascensor.playing:
		ascensor.play()

func stop_music():
	ascensor.stop()
	gameplay_music.stop()
