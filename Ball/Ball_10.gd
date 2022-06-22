extends KinematicBody2D

var speed = 850
var velocity = Vector2.ZERO


func _ready():
	randomize()
	velocity.x = [-0.8,0.8][randi() % 2]
	velocity.y = [-1,1][randi() % 2]

	
func _physics_process(delta):
	var collision_object = move_and_collide(velocity * speed * delta)
	if collision_object:
		velocity = velocity.bounce(collision_object.normal)
		$CollisionSound.play()
		if collision_object.collider.is_in_group("bricks"):
			collision_object.collider.queue_free()
			get_tree().call_group("Gamestate", "brick_up")
		if collision_object.collider.is_in_group("heart"):
			collision_object.collider.queue_free()
			get_tree().call_group("Gamestate", "ball_up")
			$HeartSound.play()


func stop_ball():
	speed = 0
	

func restart_ball():
	speed = 850
	velocity.x = [-0.8,0.8][randi() % 2]
	velocity.y = [-1,1][randi() % 2]
