extends Control

func _ready():
	$ScoreTxt.text = tr("LBL_SCORE") + ": " + str(GlobalVars.final_score)
	await  $TransitionScene.transition_finished


func _on_submit_pressed() -> void:
	if $LineEdit.text != "":
		SilentWolf.Scores.save_score($LineEdit.text, GlobalVars.final_score)
		$Submit.disabled = true
