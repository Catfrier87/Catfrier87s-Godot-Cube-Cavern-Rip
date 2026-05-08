extends HBoxContainer

@export var linked_inventory: Inventory

var base_slot = preload("res://gui/main/hotbar/hotbar_slot.tscn")

func setup(slots: int):
	for i in range(slots):
		var new_slot = base_slot.instantiate()
		self.add_child(new_slot)
		new_slot.get_node("SlotNumber").text = str(i+1)

func display_inventory(inventory: Dictionary):
	var slot_id = 0
	for key in inventory:
		if typeof(key) is int:
			var item = inventory[key]
			get_child(slot_id).display_item(item)
			slot_id += 1

func clean():
	for slot in get_children():
		remove_child(slot)
		slot.queue_free() 

func _ready() -> void:
	if linked_inventory != null:
		setup(linked_inventory.max_slots)
		display_inventory(linked_inventory.slot)
		linked_inventory.updated_slot.connect(func(slot_id, item):
			get_child(slot_id).display_item(item)
			pass
		)

func _changed_held(new_slot, last_slot) -> void:
	get_child(last_slot).deselect()
	get_child(new_slot).select()
