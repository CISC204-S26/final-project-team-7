extends CharacterBody2D

@export var speed = 200

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if name == "PlayerTop":
		direction.x = Input.get_axis("top_left", "top_right")
		direction.y = Input.get_axis("top_up", "top_down")
	else:
		direction.x = Input.get_axis("bottom_left", "bottom_right")
		direction.y = Input.get_axis("bottom_up", "bottom_down")

	velocity = direction.normalized() * speed
	move_and_slide()
