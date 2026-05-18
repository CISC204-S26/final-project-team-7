extends Area2D

@export var front_door_sprite: Sprite2D

var player_inside: Node2D = null
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_inside:
		if front_door_sprite and front_door_sprite.visible == false:
			interact_with_hidden_object()
		else:
			print("the door is locked")
		
		


func _on_body_entered(body: Node2D) -> void:
	if body.name == "oldman":
		player_inside = body




func _on_body_exited(body: Node2D) -> void:
	if body.name == "oldman":
		player_inside = null

func interact_with_hidden_object() -> void:
	get_tree().change_scene_to_file("res://maze.tscn")
