extends RigidBody3D

#--- Properties
#-- Config
@export_group("Controller")
@export var speed = 15.0
var jump_power = 150

@export var jump_height: float = 3
@export var float_time: float = 16.0/60.0

@export_group("Inventory")

@export var selected_slot: int = 1
@export var slots: int = 6

@export var inventory: Array = []

signal changed_held
signal changed_slot_amounts
signal updated_slot

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

#-- Internal

var empty_item: Item = load("res://items/empty.tres").duplicate() # Use this for empty slots to make sure fists are always the same item, this is for convenience

#-- Active

var grounded: bool = false

#--- Methods
#-- Inventory

func setup_inventory(slot_amount) -> void:
	for i in range(slot_amount):
		inventory.append(empty_item)

func check_available_slots_for(item: Item):
	var amount = 0
	for slot in inventory:
		if slot.identifier == item.identifier:
			amount += slot.stack - slot.amount
		elif slot.identifier == "Empty":
			amount += item.stack
	print(amount)
	return amount

func grab_item(item: Item):
	var available = check_available_slots_for(item)
	
	if available >= 1:
		var slot_id = 0
		for slot in inventory: # First stacks the item if possible
			if item.amount < 1: break
			print("Loop 1: ", slot)
			if slot.identifier == item.identifier and slot.amount < slot.stack:
				print(slot.amount)
				var take = clamp(item.amount, 0, slot.stack - slot.amount)
				slot.amount += item.take_amount(take)
				updated_slot.emit(slot_id, slot)
			slot_id += 1
		
		slot_id = 0
		for slot in inventory: # Then simply fills all the slots it can
			if item.amount < 1: break
			print("Loop 2: ", slot)
			if slot.identifier == "Empty":
				print("Help me charlie ", slot_id)
				var take = clamp(item.amount, 0, item.stack)
				inventory[slot_id] = item.duplicate()
				inventory[slot_id].amount = item.take_amount(take)
				updated_slot.emit(slot_id, inventory[slot_id])
			slot_id += 1

func change_slot(by: int) -> void:
	var last_slot = selected_slot
	selected_slot += by
	selected_slot = selected_slot % slots
	changed_held.emit(selected_slot, last_slot)

#--- Main

func _ready():
	GameVariables.player_body = self
	setup_inventory(slots)
	GameVariables.player_loaded.emit(self)

func _physics_process(delta: float) -> void:

	if Input.is_action_just_pressed("jump") and grounded:
		linear_velocity.y = jump_power # TODO: CC Jump
	
	#hip height
	
	if $HipRay.is_colliding():
		grounded = true
	else:
		grounded = false
		
	# Walking
	
	var input_dir = Input.get_vector("walk_left", "walk_right", "walk_forward", "walk_backward")
	var direction = ($PlayerCamera.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction != Vector3.ZERO:
		linear_velocity.x = direction.x * speed
		linear_velocity.z = direction.z * speed
	else:
		linear_velocity = Vector3(0.0, linear_velocity.y, 0.0)
		

func _input(event: InputEvent) -> void:
	if Input.is_action_just_released("next_slot"):
		change_slot(1)
	if Input.is_action_just_released("previous_slot"):
		change_slot(-1)
