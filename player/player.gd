extends CharacterBody3D

@export_group("Controller")
@export var speed = 15.0
var jump_power = 15

@export var jump_height: float = 3
@export var float_time: float = 16.0/30.0

@export_group("Inventory")

@export var selected_slot: int = 1
@export var slots: int = 6

@export var inventory: Array = []

@export_subgroup("Consumables")

@export var coins: int = 0
@export var max_coins: int = 800
@export var ammo: int = 0
@export var max_ammo: int = 64
@export var keys: int = 0
@export var max_keys: int = 32

@export_subgroup("Equips")

@export var backpack: Equip = null
@export var boots: Equip = null
@export var pouch: Equip = null
@export var map: bool = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta # TODO: Add disable gravity and weight

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power # TODO: CC Jump
	
	var input_dir = Input.get_vector("walk_left", "walk_right", "walk_forward", "walk_backward")
	var direction = ($PlayerCamera.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	move_and_slide()
