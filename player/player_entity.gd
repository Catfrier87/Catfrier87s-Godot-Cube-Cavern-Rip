extends Entity
class_name Player

@export var camera: Node3D
@export var controller: PhysicsBody3D

@export_group("Inventory")

@export var inventory: Inventory
@export var selected_slot: int = 1: set = _set_selected_slot

signal changed_slot

func _set_selected_slot(value):
	var _last_slot = selected_slot
	selected_slot = value % inventory.max_slots
	changed_slot.emit(selected_slot, _last_slot)

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
