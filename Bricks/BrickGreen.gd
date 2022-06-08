extends StaticBody2D

var taken = false

func brick_dawn():
	if not taken:
		taken = true
		get_tree().call_group("Gamestate", "brick_up")
