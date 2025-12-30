extends Node3D

@onready var camera_pivot = $"Camera Pivot"

var rotation_speed = 8

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) :
	camera_pivot.rotation_degrees.y += delta * rotation_speed


func _on_exit_pressed() -> void:
	get_tree().quit()

func _on_creative_pressed() -> void:
	get_tree().change_scene_to_packed(preload("res://scenes/tutorial_for_creative.tscn"))


func _on_parkour_pressed() -> void:
	get_tree().change_scene_to_packed(preload("res://scenes/tutorial_for_parkour.tscn"))
