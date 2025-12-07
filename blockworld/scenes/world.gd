extends Node3D

var current_spawn_point: Node3D

func _process(delta):
	if $Player.position.y < -5:
		$Player.set_global_position(Vector3(-5.0,8.0,5.0))
