extends Node2D

@onready var gate = $Maze/Gate

@onready var switch_area = $SwitchArea
@onready var switch_sprite = $SwitchArea/Sprite2D

@onready var top_door = $Maze/ExitDoorTop
@onready var bottom_door = $Maze/ExitDoorBottom

@onready var top_door_sprite = $Maze/ExitDoorTop/Sprite2D
@onready var bottom_door_sprite = $Maze/ExitDoorBottom/Sprite2D

var gate_open = false
var top_done = false
var bottom_done = false


func _ready():
	switch_area.body_entered.connect(_on_switch_pressed)
	top_door.body_entered.connect(_on_top_exit)
	bottom_door.body_entered.connect(_on_bottom_exit)

	# Doors start blocked
	top_door.monitoring = false
	bottom_door.monitoring = false


func _on_switch_pressed(body):
	if gate_open:
		return

	if body.name == "PlayerBottom":
		gate_open = true

		# Remove gate
		gate.queue_free()

		# Flip switch sprite
		switch_sprite.texture = preload("res://lever flipped.png")

		# Change both doors to open sprites
		top_door_sprite.texture = preload("res://door open.png")
		bottom_door_sprite.texture = preload("res://door open.png")

		# Activate doors
		top_door.monitoring = true
		bottom_door.monitoring = true

func _on_top_exit(body):
	if not gate_open:
		return

	if body.name == "PlayerTop":
		top_done = true
		check_level_complete()


func _on_bottom_exit(body):
	if not gate_open:
		return

	if body.name == "PlayerBottom":
		bottom_done = true
		check_level_complete()


func check_level_complete():
	if top_done and bottom_done:
		get_tree().change_scene_to_file("res://Level2.tscn")
