extends Node3D


func _ready() -> void:
	var dropped = DroppedItem.from_item(load("res://items/melee/dagger.tres").duplicate())
	add_child(dropped)
	dropped.position = Vector3(0.0, 9.0, -9.0)
	
	for i in range(100):
		dropped = DroppedItem.from_item(load("res://items/crafting/stick.tres").duplicate())
		add_child(dropped)
		dropped.position = Vector3(2, 9.0, -9.0)
