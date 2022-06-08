extends Node

var Ball = 3
var PlayerScore = 0



func _ready():
	add_to_group("Gamestate")




func _on_Bottom_body_entered(body):
	$Ball.position = Vector2(960, 540)
	Ball -= 1
	if Ball < 0:
		game_over()
		
		
		
		
func game_over():
	get_tree().change_scene("res://Levels/Game_over.tscn")
	
	
