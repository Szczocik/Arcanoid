extends CanvasLayer


func _ready():
	$Control/TextureRect/HBoxContainer/PlayerScore.text = "Score:    0"
	$Control/TextureRect/HBoxContainer/BallScore.text = "Ball: 0"
	
func update_GUI(PlayerScore, Ball):
	$Control/TextureRect/HBoxContainer/PlayerScore.text = "Score: " + str(PlayerScore)
	$Control/TextureRect/HBoxContainer/BallScore.text = "Ball: " + str(Ball)
