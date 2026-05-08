extends Item
class_name Melee

@export var damage: float = 3.0
@export var attack_range: float = 3.0
@export var cooldown: float = 0.5

func use_primary(character):
	print("Primary Detected on "+identifier)
	pass
