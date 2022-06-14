extends Node2D



func _on_Area2D_body_entered(body):
	get_tree().call_group("Gamestate", "portal_down")
	get_tree().call_group("BallGroup","restart_ball")
