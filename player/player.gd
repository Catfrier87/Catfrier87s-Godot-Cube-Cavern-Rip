extends RigidBody3D

#-- Player Stats

@export var walkspeed = 1200 ## Per Second

var move_direction := Vector3.ZERO

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		$Neck.rotate_y(-deg_to_rad(event.relative.x * 0.4))
		$Neck/PlayerCamera.rotate_x(-deg_to_rad(event.relative.y * 0.4))

func _process(delta: float) -> void:
	move_direction = Vector3.ZERO
	move_direction.x = Input.get_axis("walk_left", "walk_right")
	move_direction.z = Input.get_axis("walk_forward", "walk_backward")
	
	apply_central_force(move_direction * walkspeed * delta)
