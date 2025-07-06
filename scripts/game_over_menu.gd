extends Control

func _ready():
	$ScoreTxt.text = "SCORE: " + str(GlobalVars.final_score)
