class_name ValueMod

@export_group("Values")
@export var base = 0
@export var minimum = null
@export var maximum = null

@export var modifiers: Dictionary = {}
@export_group("Reads")
@export var active = 0 # TODO: Make this shit update!!!

signal updated

func get_value():
	var result = base
	# TODO: Priority
	for key in modifiers:
		var modifier = modifiers[key]
		if modifier[2] != null: # Addition
			result += modifier[2]
		if modifier[3] != null:
			result *= modifier[3]
	
	if maximum != null:
		result = max(result, maximum)
	if minimum != null:
		result = min(result, minimum)
	
	return result

func add(mod_key: String, priority: int, addition, multiplier):
	if modifiers.has(mod_key):
		print("WARNING: Overwrote modifier instead of removing it, mod_key: "+mod_key)
	modifiers[mod_key] = [priority, addition, multiplier]
	updated.emit()

func remove(mod_key: String) -> bool:
	var existed = modifiers.erase(mod_key)
	if existed:
		updated.emit()
	return existed
