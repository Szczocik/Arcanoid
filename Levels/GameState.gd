extends Node

var Ball = 3
var PlayerScore = 0



func _ready():
	add_to_group("Gamestate")
	update_GUI()


func _on_Bottom_body_entered(body):
	$Ball.position = Vector2(860, 540)
	Ball -= 1
	update_GUI()
	if Ball < 0:
		game_over()
		


func brick_up():
	PlayerScore += 1
	update_GUI()
	if PlayerScore == 5:
		change_scene()
	
	
func change_scene():
	get_tree().change_scene("res://Levels/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")


func update_GUI():
	get_tree().call_group("GUI", "update_GUI", PlayerScore, Ball)
	
	
	
		
func game_over():
	get_tree().change_scene("res://Levels/Game_over.tscn")
	
	
