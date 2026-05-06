extends CharacterBody2D

@export var speed: float = 200.0
var direction: Vector2 = Vector2.ZERO

func _ready():
	direction = Vector2(
		randf_range(-1,1),
		randf_range(-1,1)
	).normalized()


func _physics_process(delta: float) -> void:
	var velocity_vector = direction * speed * delta
	var collision = move_and_collide(velocity_vector)
	if collision:
		direction = direction.reflect(collision.get_normal())
		position += collision.get_normal()* 1.0
		var collider = collision.get_collider()
		if collider.name.begins_with("p1") or collider.name.begins_with("p2"):
			get_tree().change_scene_to_file("res://LOSER.tscn")
		var remainder = collision.get_remainder().reflect(collision.get_normal())
		move_and_collide(remainder)
