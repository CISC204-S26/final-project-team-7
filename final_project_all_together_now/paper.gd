extends Area2D

var player_inside = false

@onready var label = $Label

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("Interact"):
		label.visible = true

func _on_body_entered(_body):
	player_inside = true

func _on_body_exited(_body):
	player_inside = false
	label.visible = false
