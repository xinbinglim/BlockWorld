extends Node3D

var current_spawn_point: Node3D

func _process(delta):
	pass

func respawn():
	$Player.set_global_position(Vector3(-.0,8.0,5.0))
