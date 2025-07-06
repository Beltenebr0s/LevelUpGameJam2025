extends Node2D

func _ready():
	conectar_spawns()
	
func  _process(delta):
	pass

func conectar_spawns():
	var spawns_obstaculos = $Spawns.get_children()
	for spawn : Spawn in spawns_obstaculos:
		spawn.obstaculo_creado.connect(nuevo_obstaculo)
	
func nuevo_obstaculo(obs : Obstaculo):
	obs.collided_with_player.connect(jugador_chocado)
	
func jugador_chocado():
	print("Game over???")
