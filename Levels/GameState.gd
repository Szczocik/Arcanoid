extends Node

const CLOUD = preload("res://NPCs/Cloud.tscn")

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
		

func ball_up():
	Ball += 1
	update_GUI()
	
func ball_down():
	Ball -= 1
	update_GUI()
	

func brick_up():
	PlayerScore += 1
	update_GUI()
	if PlayerScore == 25:
		change_scene()
	
	
func cloud_spawn(start_pos):
	var cloud = CLOUD.instance()
	var cloud_start_node_name = "StartPositions/CloudStart" + str(start_pos)
	cloud.position = get_node(cloud_start_node_name).position
	add_child(cloud)
	
	var timer_node_name = "CloudTimer/Timer" + str(start_pos)
	get_node(timer_node_name).wait_time = rand_range(10,10)
	update_GUI()
	

	
	
func change_scene():
	get_tree().change_scene("res://Levels/Level_" + str(int(get_tree().current_scene.name) + 1) + ".tscn")


func update_GUI():
	get_tree().call_group("GUI", "update_GUI", PlayerScore, Ball)
		
		
func game_over():
	get_tree().change_scene("res://Levels/Game_over.tscn")
	
	


func _on_Timer1_timeout(): cloud_spawn(1)
func _on_Timer2_timeout(): cloud_spawn(2)
