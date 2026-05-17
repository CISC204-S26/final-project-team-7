extends Node2D

@onready var clown = $Clown
@onready var man = $Man
@onready var angel = $Angel
@onready var one = $one
@onready var two = $two
@onready var three = $three
@onready var code_input = $CodeInput
@onready var staircase = $Staircase
@onready var Door2 = $Door2
@onready var staircase_collision = $Staircase/CollisionShape2D
@onready var wall = $Wall
@onready var wrong_sprite = $WrongCode

func _ready():
	staircase.visible = false
	staircase_collision.disabled = true
	wrong_sprite.visible = false

func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text == "312":
		staircase.visible = true
		clown.visible = false
		man.visible = false
		angel.visible = false
		one.visible = false
		two.visible = false
		three.visible = false
		Door2.visible = true
		staircase_collision.disabled = false
		wall.visible = false
		
	else:
		wrong_sprite.visible = true
		await get_tree().create_timer(2.0).timeout
		wrong_sprite.visible = false
