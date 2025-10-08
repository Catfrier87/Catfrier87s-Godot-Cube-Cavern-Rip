@icon("res://classes/icons/droppeditem.png")
class_name DroppedItem
extends Interactable

@export var linked_item: Item

func _REMOVE_LATER(amount):
	var final = amount + (linked_item.stack - amount)
	linked_item.stack -= final
	if linked_item.stack <= 0:
		free()
	pass

func interact(player):
	player.grab_item(linked_item)

static func from_item(item: Item) -> DroppedItem:
	var base = load("res://classes/DroppedItemBase.tscn").instantiate()
	base.linked_item = item
	base.hover_text = "Pick up text goes here"
	base.description = item.item_description
	
	item.all_taken.connect(func(): base.queue_free())
	
	return base
