extends Resource
class_name StatMod

@export var additives: Dictionary = {}
@export var multipliers: Dictionary = {}

func apply(object: Node):
	for key in additives:
		if key in object:
			object[key] += additives[key]
	for key in multipliers:
		if key in object:
			object[key] *= multipliers[key]
