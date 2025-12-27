extends Node3D

var current_spawn_point: Node3D


func _process(delta: float) -> void:
	$Lava.position.y += 0.01
	if $Player.position.y < -1 or ($Player.position.y - 2.2) < $Lava.position.y:
		respawn()

func respawn():
	$Player.set_global_position(Vector3(-.0,8.0,5.0))
	if $Lava.position.y > 4.5:
		get_tree().change_scene_to_packed(preload('res://game_over.tscn'))
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		respawn()

func _on_lava_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body.is_in_group('Player'):
		respawn()
