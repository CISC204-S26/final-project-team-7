extends CharacterBody2D
@export var player_id: String = "p2"

const SPEED = 300.0
const JUMP_VELOCITY = -500.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed(player_id + "up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis(player_id + "left", player_id + "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		if collider is RigidBody2D:
			var push_force = 100.0
			collider.apply_central_impulse(collision.get_normal() * -push_force)
	
