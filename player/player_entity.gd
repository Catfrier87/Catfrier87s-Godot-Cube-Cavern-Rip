extends Entity
class_name Player

@export var camera: Node3D

@export_group("Inventory")

@export var inventory: Inventory
@export var held_slot: int = 1: set = _set_selected_slot

signal changed_slot

func _set_selected_slot(value):
	var _last_slot = held_slot
	#selected_slot = value % inventory.max_slots-1
	
	held_slot = value
	
	if held_slot > inventory.max_slots:
		held_slot = held_slot % inventory.max_slots
	elif held_slot < 1:
		held_slot = inventory.max_slots - (held_slot & inventory.max_slots)
	
	print(held_slot)
	
	"""
	print("-----------")
	print("start: ",value)
	selected_slot = value % (inventory.max_slots + 1)
	print("mod:   ",selected_slot)
	if clamp(selected_slot, 1, inventory.max_slots) != selected_slot:
		print("Number out of range")
	"""
	changed_slot.emit(held_slot, _last_slot)

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
@export var lantern: bool = false

#- Functions
