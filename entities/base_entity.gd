extends Node
class_name Entity

#- Health

@export var health: float = 1
@export var max_health: float = 1

func mod_health(amount: float) -> float:
	var result = clamp(health + amount, 0, max_health)
	var diff = result - health
	health = result
	
	if health <= 0:
		pass
	
	return diff

#- Modifiers

var property_mods: Dictionary = {} # Each key is the same as a property, stores (Did I deadass forget to finish this comment?)
var modifiers: Dictionary = {} # Each key is a modifier that handles multiple properties

func modify_property(): ## TODO: ADD!
	print("Unadded! Please FUCKING STANDARDIZE")

func add_modifier(): ## TODO: ADD!
	print("Unadded! Please FUCKING STANDARDIZE")

func remove_modifier(): ## TODO: ADD!
	print("Unadded! Please FUCKING STANDARDIZE")

# I GET IT, I FUCKING GET IT, CALM THE FUCK DOWN, GOOD GOD

func on_death(): # The post-mortal divine
	pass
