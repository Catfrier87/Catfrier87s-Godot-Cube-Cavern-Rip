extends Resource
class_name Item

#- Functional
@export var identifier: String = "LoremIpsum"
@export var stack: int = 1 ## Stack size limit.
@export var amount: int = 1 ## The amount of items currently in the stack.
#@export var active: Dictionary = {} ## It hurts.

var property_mods: Dictionary = {} # Each key is the same as a property, stores (Did I deadass forget to finish this comment?)
var modifiers: Dictionary = {} # Each key is a modifier that handles multiple properties

#- Visual
@export var item_name: String = "Lorem Ipsum"
@export var item_description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
@export var image: String = "res://placeholder.png" ## res:// Path
@export var model: String = "res://placeholder" ## res:// Path

## Allows access to property_mods without worrying about having to create a PropertyMod first
func modify_property(property_name: String, mod_key: String, priority: int, addition: float, multiplier: float): ## Waga baba boo boo
	var property_mod: ValueMod
	
	if not property_mods.has(property_name):
		property_mod = ValueMod.new()
		property_mod.base = get(property_name)
		property_mods[property_name] = property_mod
	else:
		property_mod = property_mods[property_name]
	
	property_mod.add(mod_key, priority, addition, multiplier)
	# TODO: Universalize by making it take the function from a module script

func add_modifier(modifier: Modifier):
	for property_key in modifier.mod_info:
		var values = modifier.mod_info[property_key]
		modify_property(property_key, modifier.mod_id, values[1], values[2], values[3])
