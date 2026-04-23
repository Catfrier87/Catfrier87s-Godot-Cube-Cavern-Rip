extends Node
class_name Inventory

@export var max_slots: int = 10

@export var slot: Dictionary = {} # Supposed to be accessed like Inventory.Slot[1]

func check_available_slots_for(item: Item):
	var amount = 0
	for slot_key in slot:
		if slot.info.identifier == item.info.identifier:
			amount += slot.stack - slot.amount
		elif slot.info.identifier == "Empty":
			amount += item.info.stack
	
	return amount

""" PORTOVER
func check_available_slots_for(item: Item):
	var amount = 0
	for slot in inventory:
		if slot.info.identifier == item.info.identifier:
			amount += slot.stack - slot.amount
		elif slot.info.identifier == "Empty":
			amount += item.info.stack
	
	return amount

func grab_item(item: Item):
	var available = check_available_slots_for(item)
	
	if available >= 1:
		var slot_id = 0
		for slot in inventory: # First stacks the item if possible
			if item.amount < 1: break
			if slot.identifier == item.identifier and slot.amount < slot.stack:
				var take = clamp(item.amount, 0, slot.stack - slot.amount)
				slot.amount += item.take_amount(take)
				updated_slot.emit(slot_id, slot)
			slot_id += 1
		
		slot_id = 0
		for slot in inventory: # Then simply fills all the slots it can
			if item.amount < 1: break
			if slot.identifier == "Empty":
				var take = clamp(item.amount, 0, item.stack)
				inventory[slot_id] = item.duplicate()
				inventory[slot_id].amount = item.take_amount(take)
				updated_slot.emit(slot_id, inventory[slot_id])
			slot_id += 1


"""
