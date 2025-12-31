extends Node3D

var current_spawn_point: Node3D
@onready var frontview = $Player/FrontView
var tutorial_done = false

func _ready() -> void:
	$Escape.hide()
	$Player/Camera3D.make_current()
	$Tutorial/Label_1.hide()
	$Tutorial/Label_2.hide()
	$Tutorial/Label_3.hide()
	$Tutorial/Label_4.hide()
	$Tutorial/Label_5.hide()
	$gameover.hide()
	
	
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
		if $Lava.position.y > 4:
			$"Camera Pivot/Camera3D".make_current()
			$CanvasLayer/Label.hide()
			$gameover.show()
			Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
			if $Player.position.y - 2.2 < $Lava.position.y:
				respawn()
		if tutorial_done == true:
			$Lava.position.y += 0.005
	

func respawn():
	$Player.set_global_position(Vector3(-.0,8.0,5.0))


func _on_lava_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		respawn()

func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_back_pressed() -> void:
	$Escape.hide()
	$CanvasLayer/Label.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _on_tutorial_1_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		$CanvasLayer/Label.hide()
		$Tutorial/Label_1.show()


func _on_tutorial_1_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		$Tutorial/Label_1.hide()
		$CanvasLayer/Label.show()
		tutorial_done = true

func _on_tutorial_2_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		$CanvasLayer/Label.hide()
		$Tutorial/Label_2.show()


func _on_tutorial_2_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		$Tutorial/Label_2.hide()
		$CanvasLayer/Label.show()


func _on_tutorial_3_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		$CanvasLayer/Label.hide()
		$Tutorial/Label_3.show()


func _on_tutorial_3_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		$Tutorial/Label_3.hide()
		$CanvasLayer/Label.show()


func _on_tutorial_4_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		$CanvasLayer/Label.hide()
		$Tutorial/Label_4.show()

func _on_tutorial_4_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		$Tutorial/Label_4.hide()
		$CanvasLayer/Label.show()
		
func _on_tutorial_5_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		$CanvasLayer/Label.hide()
		$Tutorial/Label_5.show()

func _on_tutorial_5_body_shape_exited(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		$Tutorial/Label_5.hide()
		$CanvasLayer/Label.show()

func _on_lava_1_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	respawn()

func _on_lava_2_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	respawn()


func _on_lava_3_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	respawn()


func _on_lava_4_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	respawn()
