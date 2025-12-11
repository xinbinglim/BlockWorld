extends VBoxContainer

func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_packed(preload("res://scenes/Survival.tscn"))

func _on_mini_games_pressed() -> void:
	get_tree().change_scene_to_packed(preload("res://scenes/MiniGameLava.tscn"))

func _on_exit_pressed() -> void:
	get_tree().quit()
