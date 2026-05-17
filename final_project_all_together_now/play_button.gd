extends Area2D


func _input_event(_viewport, event, _shape_idx):

	if event is InputEventMouseButton and event.pressed:
		get_tree().change_scene_to_file("res://parkourlvl.tscn")
