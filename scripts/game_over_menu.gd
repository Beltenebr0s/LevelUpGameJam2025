extends Control

func _ready():
	$ScoreTxt.text = tr("LBL_SCORE") + ": " + str(GlobalVars.final_score)
	await  $TransitionScene.transition_finished
