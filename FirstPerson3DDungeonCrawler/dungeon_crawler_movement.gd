extends Node3D

var cell_size: int = 10
var turn_rotation: int = 90
var tween_rotation: Tween
var tween_movement: Tween

@onready var camera_3d: Camera3D = $Camera3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("left") or Input.is_action_just_pressed("right"):
		if tween_rotation: tween_rotation.kill()
		tween_rotation = create_tween()
		tween_rotation.tween_property(self, "rotation_degrees", Vector3(0.0, rotation_degrees.y + turn_rotation * Input.get_axis("right", "left"), 0.0), 0.5)
	elif Input.is_action_just_pressed("down") or Input.is_action_just_pressed("up"):
		if tween_movement: tween_movement.kill()
		tween_movement = create_tween()
		tween_movement.tween_property(self, "position", Vector3(0, 0, position.z + cell_size * Input.get_axis("up", "down")), 0.5)
