extends Area2D

@export var spawn_point: Marker2D

var player_inside: Node2D = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_inside and Input.is_action_just_pressed("Interact"):
		teleport_player()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "oldman":
		player_inside = body
	
	


func _on_body_exited(body: Node2D) -> void:
	if body.name == "oldman":
		player_inside = null
		
func teleport_player() -> void:
	if spawn_point:
		player_inside.velocity = Vector2.ZERO
		player_inside.set_deferred("global_position", spawn_point.global_position)
	else:
		push_warning("PORTAL IS MESSED UP")
