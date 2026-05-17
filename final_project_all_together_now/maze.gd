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

	# doors disabled until switch pressed
	top_door.monitoring = false
	bottom_door.monitoring = false


func _on_switch_pressed(body):
	if gate_open:
		return

	if body.name == "PlayerBottom":
		gate_open = true

		# Remove gate
		gate.queue_free()

		# Flip lever
		switch_sprite.texture = preload("res://lever flipped.png")

		# Open door sprites
		top_door_sprite.texture = preload("res://door open.png")
		bottom_door_sprite.texture = preload("res://door open.png")

		# Enable door triggers
		top_door.monitoring = true
		bottom_door.monitoring = true


func _on_top_exit(body):
	if body.name == "PlayerTop":
		top_done = true
		check_level_complete()


func _on_bottom_exit(body):
	if body.name == "PlayerBottom":
		bottom_done = true
		check_level_complete()


func check_level_complete():
	if top_done and bottom_done:
		print("Loading Escape Room...")
		get_tree().change_scene_to_file("res://escaperoom.tscn")
