extends Control

func _ready():
	SilentWolf.Scores.sw_save_score_complete.connect(score_saved)
	$ScoreTxt.text = tr("LBL_SCORE") + ": " + str(GlobalVars.final_score)
	await  $TransitionScene.transition_finished

func score_saved(sw_result : Dictionary):
	if (sw_result["success"] == true):
		$Msg.text = tr("LBL_MSG_SUCCESS")
	else:
		$Msg.text = tr("LBL_MSG_FAIL")
		$Submit.disabled = false

func _on_submit_pressed() -> void:
	if $LineEdit.text != "":
		SilentWolf.Scores.save_score($LineEdit.text, GlobalVars.final_score)
		$Submit.disabled = true
