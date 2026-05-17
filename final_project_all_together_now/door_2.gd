extends Area2D

var oldman_inside := false
var kid_inside := false
var transitioning := false


func _on_body_entered(body):

	if body.name == "oldman":
		oldman_inside = true

	if body.name == "kid":
		kid_inside = true

	check_players()


func _on_body_exited(body):

	if body.name == "oldman":
		oldman_inside = false

	if body.name == "kid":
		kid_inside = false


func check_players():

	if transitioning:
		return

	if oldman_inside and kid_inside:
		transitioning = true
		get_tree().change_scene_to_file("res://FinalScene.tscn")
