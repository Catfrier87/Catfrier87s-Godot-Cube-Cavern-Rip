@icon("res://classes/icons/droppeditem.png")
class_name DroppedItem
extends Node3D

@export var linked_item: BaseItem
@export var stack: int = 1

func collect(amount):
	var final = amount + (stack - amount)
	stack -= final
	if stack <= 0:
		free()
	pass
