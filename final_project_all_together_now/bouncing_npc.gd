extends CharacterBody2D

@export var speed := 80

var direction := Vector2.ZERO
var change_timer := 0.0


func _ready():
	pick_new_direction()


func _physics_process(delta):
	change_timer -= delta

	if change_timer <= 0:
		pick_new_direction()

	velocity = direction * speed
	move_and_slide()

	# Check collisions with player
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()

		if collider.name == "PlayerBottom":
			get_tree().reload_current_scene()
			return

	# Bounce off walls
	if is_on_wall():
		direction = -direction


func pick_new_direction():
	var angle = randf() * TAU
	direction = Vector2(cos(angle), sin(angle))
	change_timer = randf_range(1.0, 3.0)
