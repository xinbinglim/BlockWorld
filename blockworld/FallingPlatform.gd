extends Node3D

@onready var platform: StaticBody3D = $Platform
@onready var area_3d: Area3D = $Platform/Area3D
@onready var timer: Timer = $Timer
@onready var restore_timer: Timer = $RestoreTimer
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_shape_entered(body_rid: RID, body: Node3D, body_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group('Player'):
		if timer.is_stopped():
			timer.start()
		animation_player.play("Impact")


func _on_timer_timeout() -> void:
	animation_player.play("fall")
	set_collision(false)
	await get_tree().create_timer(0.42).timeout
	restore_timer.start()


func _on_restore_timer_timeout() -> void:
	animation_player.play_backwards("fall")
	set_collision(true)
	
func set_collision(enable: bool) -> void:
	platform.set_collision_layer_value(1,enable)
	area_3d.set_collision_layer_value(1,enable)
	platform.set_collision_mask_value(1,enable)
	area_3d.set_collision_mask_value(1,enable)
