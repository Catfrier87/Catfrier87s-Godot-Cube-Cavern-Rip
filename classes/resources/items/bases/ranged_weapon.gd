@icon("res://classes/icons/resources/ranged.png")
extends Item
class_name RangedWeapon

@export var cooldown: float = 0.5
@export var fire_mode: int = 1 ## TODO: Make fire_mode Enum with SEMI (1) and AUTO (2)
@export var pellets: int = 1
@export_group("Projectile Info")
@export var damage: float = 3.0
@export var spread: float = 0.0
@export var projectile_speed: float = 20.0  ## Per Second.
@export var projectile_model: String = "res://placeholder"
@export_group("Loading Info")
@export var bullet_cost: int = 1
