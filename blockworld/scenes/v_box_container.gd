extends VBoxContainer

const World = preload("res://scenes/world.tscn")

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_packed(World)


func _on_exit_pressed() -> void:
	get_tree().quit()
