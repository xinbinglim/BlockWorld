extends Node3D

var current_spawn_point: Node3D
@onready var frontview = $Player/FrontView
var tutorial_done = false

func _ready() -> void:
	$Escape.hide()
	$Player/Camera3D.make_current()
	
	
func _init() -> void:
	pass

func _process(delta: float) -> void:
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
	if $Escape.visible == false:
		if $Player.position.y < -1 or ($Player.position.y - 2.2) < $Lava.position.y:
			respawn()
		if tutorial_done == true:
			$Lava.position.y += 0.005
	

func respawn():
	$Player.set_global_position(Vector3(-.0,8.0,5.0))
	if $Lava.position.y > 4.5:
		get_tree().change_scene_to_packed(preload('res://scenes/game_over.tscn'))
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)


func _on_lava_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group('Player'):
		respawn()

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	$Escape.hide()
	$CanvasLayer/Label.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
