extends Item
class_name Melee

@export var damage: float = 3.0
@export var attack_range: float = 3.0
@export var cooldown: float = 0.5

func use_primary(entity: Entity):
	var item_ray = entity.camera.get_node("ItemRay")
	var result = item_ray.check_dist(attack_range)
	
	if result != null:
		var target = result.get_parent()
		if target is Entity:
			print(target.body, " ", target.max_health, " ", target.health)
			target.mod_health(-damage)
