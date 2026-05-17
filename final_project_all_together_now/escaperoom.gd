extends Node2D

@onready var clown = $Clown
@onready var man = $Man
@onready var angel = $Angel
@onready var one = $one
@onready var two = $two
@onready var three = $three
@onready var code_input = $CodeInput
@onready var staircase = $Staircase
@onready var Door1 = $Door1
@onready var Door2 = $Door2

func _ready():
	staircase.visible = false

func _on_line_edit_text_submitted(new_text: String) -> void:
	if new_text == "312":
		staircase.visible = true
		clown.visible = false
		man.visible = false
		angel.visible = false
		one.visible = false
		two.visible = false
		three.visible = false
		Door1.visible = true
		Door2.visible = true
	else:
		print("Wrong code")
