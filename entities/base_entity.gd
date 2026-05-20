extends Node
class_name Entity

@export var body: Node3D

#--- Health

@export var max_health: float = 10
@export var health: float = 10 : set = _set_health
# Note: I am not using setters because they are less versatile (no damagetype support) and will get tripped by Exported Variables.

signal health_changed

func _set_health(value):
	var old = health
	health = value
	health_changed.emit(health, old)

func mod_health(amount):
	var new_value = clamp(health + amount, 0, max_health)
	var old_value = health
	
	health = new_value
	health_changed.emit(new_value, old_value)

#--- Modifiers

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
