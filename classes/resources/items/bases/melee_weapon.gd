@icon("res://classes/icons/resources/melee.png")
extends Item
class_name MeleeWeapon

@export var damage: float = 3
@export var attack_range: float = 3
@export var cooldown: float = 0.5

func use_primary(character):
	var item_cast: RayCast3D = character.get_node("Camera").get_node("ItemRay")
	
	item_cast.target_position = Vector3.FORWARD * attack_range
	item_cast.force_raycast_update()
	
	if item_cast.get_collider():
		print(item_cast.get_collider())
