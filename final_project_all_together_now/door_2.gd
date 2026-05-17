extends Area2D

@onready var level = get_parent()

func _on_body_entered(body):
	if body.name == "kid":
		level.kid_on_door2 = true
		level.check_doors()

func _on_body_exited(body):
	if body.name == "kid":
		level.kid_on_door2 = false
