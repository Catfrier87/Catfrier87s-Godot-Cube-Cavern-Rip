@icon("res://classes/icons/resources/baseitem.png")
extends Resource
class_name Item

@export var identifier: String = "LoremIpsum"
@export var stack: int = 1 ## Maximum amount of items per stack. (If this goes below 1 the engine engine shits itself)
@export var amount: int = 1 ## The amount of items currently in the stack.
#- Visual
@export var item_name: String = "Lorem Ipsum"
@export var item_description: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
@export var image: String = "res://gd.svg" ## res:// Path
@export var model: String = "res://placeholder" ## res:// Path

signal all_taken

func take_amount(take):
	var available = clamp(take, 0, amount)
	amount -= available
	if amount < 1:
		all_taken.emit()
	
	return available

func get_modded(): # TODO: Make it able to get an array of modifiers and use that
	return self
