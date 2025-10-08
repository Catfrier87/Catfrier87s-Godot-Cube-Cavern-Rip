extends Camera3D

@export var sensitivity = 0.01

var camera_rotation = Vector3()

func _ready():
	await GameVariables.player_loaded
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion:
		camera_rotation += Vector3(event.relative.x, event.relative.y, 0) * sensitivity
		camera_rotation.y = clamp(camera_rotation.y, -deg_to_rad(89), deg_to_rad(89))
		
		transform.basis = Basis()
		
		rotate_object_local(Vector3.UP, -camera_rotation.x)
		rotate_object_local(Vector3.RIGHT, -camera_rotation.y)
