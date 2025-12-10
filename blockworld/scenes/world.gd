extends Node3D

var current_spawn_point: Node3D

func _process(delta):
	if $Player.position.y < -5:
		respawn()
	if ($Player.position.y - 1.8) < $Lava.position.y :
		respawn()
	$Lava.position.y += 0.01

func respawn():
	$Player.set_global_position(Vector3(-.0,8.0,5.0))
	if $Lava.position.y > 7.5:
		get_tree().change_scene_to_packed(preload('res://game_over.tscn'))
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	if body == $Player:
		respawn()
