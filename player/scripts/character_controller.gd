extends CharacterBody3D


@export var walkspeed = 15
@export var REPLACE_Jumpvel = 10


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = REPLACE_Jumpvel
		
	var input_dir = Input.get_vector("walk_left", "walk_right", "walk_forward", "walk_backward")
	var gorefuck = Basis.from_euler(Vector3(0,-%PlayerCamera.camera_rotation.x,0))
	
	var direction = (gorefuck * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * walkspeed
		velocity.z = direction.z * walkspeed
	else:
		velocity.x = move_toward(velocity.x, 0, walkspeed)
		velocity.z = move_toward(velocity.z, 0, walkspeed)

	move_and_slide()
