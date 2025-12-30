extends Node3D

var current_spawn_point: Node3D
@onready var frontview = $Player/FrontView

func _ready() -> void:
	$Escape.hide()

func _process(delta):
	if Input.is_action_just_pressed('change view'):
		if frontview.current == true:
			$CanvasLayer/Label.show()
			$Player/Camera3D.make_current()
		else:
			$CanvasLayer/Label.hide()
			frontview.make_current()
	if Input.is_action_just_pressed("Escape"):
		$Escape.show()
		$CanvasLayer/Label.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

func respawn():
	$Player.set_global_position(Vector3(-.0,8.0,5.0))

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	$Escape.hide()
	$CanvasLayer/Label.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
