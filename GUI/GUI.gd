extends CanvasLayer


func _ready():
	$Control/TextureRect/HBoxContainer/PlayerScore.text = "Score: 0"
	$Control/TextureRect/HBoxContainer/BallScore.text = "Ball: 0"
	
func update_GUI(PlayerScore):
	$Control/TextureRect/HBoxContainer/PlayerScore.text = "Score: " + str(PlayerScore)
	
