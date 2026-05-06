extends Entity
class_name Player

@export var camera: Node3D
@export var controller: PhysicsBody3D

@export_group("Inventory")

@export var inventory: Inventory

@export_subgroup("Consumables")

@export var coins: int = 0
@export var max_coins: int = 800
@export var ammo: int = 0
@export var max_ammo: int = 64
@export var keys: int = 0
@export var max_keys: int = 32

@export_subgroup("Equips")

#@export var backpack: Equip = null
#@export var boots: Equip = null
#@export var pouch: Equip = null
@export var map: bool = false
@export var lantern: bool = false
